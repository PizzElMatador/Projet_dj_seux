import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { PrestationService } from '../../services/prestation.service';
import { Client } from '../../models/user.model';
import { Reservation } from '../../models/prestation.model';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  currentUser = signal<Client | null>(null);
  editMode = signal(false);
  loading = signal(false);
  successMessage = signal('');
  errorMessage = signal('');
  reservations = signal<Reservation[]>([]);
  loadingReservations = signal(false);

  // Form fields
  prenom = signal('');
  nom = signal('');
  email = signal('');
  telephone = signal('');
  adresse = signal('');

  constructor(
    private authService: AuthService,
    private prestationService: PrestationService,
    private router: Router
  ) {}

  ngOnInit(): void {
    const user = this.authService.currentUser();
    if (user) {
      this.currentUser.set(user);
      this.initializeForm(user);
      this.loadReservations(user.id_utilisateur);
    } else {
      this.router.navigate(['/login']);
    }
  }

  initializeForm(user: Client): void {
    this.prenom.set(user.prenom || '');
    this.nom.set(user.nom || '');
    this.email.set(user.email || '');
    this.telephone.set((user as any).telephone || '');
    this.adresse.set((user as any).adresse || '');
  }

  toggleEditMode(): void {
    if (this.editMode()) {
      this.editMode.set(false);
      this.errorMessage.set('');
      this.successMessage.set('');
      if (this.currentUser()) {
        this.initializeForm(this.currentUser()!);
      }
    } else {
      this.editMode.set(true);
    }
  }

  saveProfile(): void {
    if (this.validateForm()) {
      this.loading.set(true);
      this.errorMessage.set('');
      this.successMessage.set('');

      // Simuler l'appel API
      setTimeout(() => {
        const updatedUser: Client = {
          ...this.currentUser()!,
          prenom: this.prenom(),
          nom: this.nom(),
          email: this.email(),
          telephone: this.telephone(),
          adresse: this.adresse(),
        } as Client;

        // Mettre à jour le service et le localStorage
        this.authService.updateUser(updatedUser);
        this.currentUser.set(updatedUser);

        this.successMessage.set('✅ Profil mis à jour avec succès!');
        this.editMode.set(false);
        this.loading.set(false);

        // Masquer le message après 3 secondes
        setTimeout(() => {
          this.successMessage.set('');
        }, 3000);
      }, 500);
    }
  }

  validateForm(): boolean {
    if (!this.prenom().trim()) {
      this.errorMessage.set('Le prénom est obligatoire');
      return false;
    }
    if (!this.nom().trim()) {
      this.errorMessage.set('Le nom est obligatoire');
      return false;
    }
    if (!this.email().trim() || !this.email().includes('@')) {
      this.errorMessage.set('Email valide requis');
      return false;
    }
    return true;
  }

  loadReservations(clientId: number): void {
    this.loadingReservations.set(true);
    this.prestationService.getReservationsByClient(clientId).subscribe({
      next: (data) => {
        // Trier les réservations par date décroissante (plus récentes d'abord)
        const sortedReservations = data.sort((a, b) => 
          new Date(b.date_reservation).getTime() - new Date(a.date_reservation).getTime()
        );
        this.reservations.set(sortedReservations);
        this.loadingReservations.set(false);
      },
      error: (err) => {
        console.error('Erreur lors du chargement des réservations', err);
        this.loadingReservations.set(false);
      }
    });
  }

  getStatusBadgeClass(statut: string): string {
    switch(statut) {
      case 'confirmée': return 'badge-confirmed';
      case 'en attente': return 'badge-pending';
      case 'complétée': return 'badge-completed';
      case 'annulée': return 'badge-cancelled';
      default: return '';
    }
  }

  getStatusLabel(statut: string): string {
    const labels: { [key: string]: string } = {
      'confirmée': 'Confirmée',
      'en attente': 'En attente',
      'complétée': 'Complétée',
      'annulée': 'Annulée'
    };
    return labels[statut] || statut;
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }

  goToPrestations(): void {
    this.router.navigate(['/prestations']);
  }
}
