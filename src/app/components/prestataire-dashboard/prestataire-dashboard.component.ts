import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { PrestataireService } from '../../services/prestataire.service';
import { Prestation, Prestataire } from '../../models/prestation.model';
import { Client } from '../../models/user.model';

@Component({
  selector: 'app-prestataire-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './prestataire-dashboard.component.html',
  styleUrls: ['./prestataire-dashboard.component.css']
})
export class PrestataireDashboardComponent implements OnInit {
  currentUser = signal<Client | null>(null);
  annonces = signal<Prestation[]>([]);
  serviceTypes = signal<{ id: number; nom: string }[]>([]);
  loading = signal(false);
  successMessage = signal('');
  errorMessage = signal('');
  reservations = signal<any[]>([]);

  showCreateModal = signal(false);
  editingAnnonce = signal<Prestation | null>(null);

  // Form fields
  nom_prestation = signal('');
  description_presta = signal('');
  prix = signal('');
  nom_type = signal('');
  id_type = signal(1);

  constructor(
    private authService: AuthService,
    private prestataireService: PrestataireService,
    private router: Router
  ) {}

  ngOnInit(): void {
    const user = this.authService.currentUser();
    if (user) {
      this.currentUser.set(user);
      this.loadAnnonces();
      this.loadReservations();
      this.loadServiceTypes();
    } else {
      this.router.navigate(['/login']);
    }
  }

  loadAnnonces(): void {
    this.loading.set(true);
    const prestataire: Prestataire = {
      id: this.currentUser()?.id_utilisateur || 1,
      nom: this.currentUser()?.nom || '',
      prenom: this.currentUser()?.prenom || '',
      email: this.currentUser()?.email || '',
      note: 4.5,
      nombreAvis: 12
    };

    this.prestataireService.getAnnoncesByPrestataire(prestataire.id).subscribe({
      next: (data) => {
        this.annonces.set(data);
        this.loading.set(false);
      },
      error: (err) => {
        console.error('Erreur', err);
        this.loading.set(false);
      }
    });
  }

  loadServiceTypes(): void {
    this.prestataireService.getServiceTypes().subscribe({
      next: (types) => {
        this.serviceTypes.set(types);
      }
    });
  }

  openCreateModal(): void {
    this.editingAnnonce.set(null);
    this.resetForm();
    this.showCreateModal.set(true);
  }

  openEditModal(annonce: Prestation): void {
    this.editingAnnonce.set(annonce);
    this.nom_prestation.set(annonce.nom_prestation);
    this.description_presta.set(annonce.description_presta);
    this.prix.set(annonce.prix.toString());
    this.nom_type.set(annonce.nom_type);
    this.id_type.set(annonce.id_type);
    this.showCreateModal.set(true);
  }

  closeModal(): void {
    this.showCreateModal.set(false);
    this.editingAnnonce.set(null);
    this.resetForm();
    this.errorMessage.set('');
  }

  resetForm(): void {
    this.nom_prestation.set('');
    this.description_presta.set('');
    this.prix.set('');
    this.nom_type.set('');
    this.id_type.set(1);
  }

  saveAnnonce(): void {
    if (!this.validateForm()) {
      return;
    }

    this.loading.set(true);
    this.errorMessage.set('');
    this.successMessage.set('');

    const prestataire: Prestataire = {
      id: this.currentUser()?.id_utilisateur || 1,
      nom: this.currentUser()?.nom || '',
      prenom: this.currentUser()?.prenom || '',
      email: this.currentUser()?.email || '',
      note: 4.5,
      nombreAvis: 12
    };

    const data = {
      nom_prestation: this.nom_prestation(),
      description_presta: this.description_presta(),
      prix: parseFloat(this.prix()),
      nom_type: this.nom_type(),
      id_type: this.id_type()
    };

    if (this.editingAnnonce()) {
      // Mettre à jour
      this.prestataireService.updateAnnonce(this.editingAnnonce()!.id_prestation, data).subscribe({
        next: () => {
          this.successMessage.set('✅ Annonce mise à jour avec succès!');
          this.closeModal();
          this.loadAnnonces();
          setTimeout(() => this.successMessage.set(''), 3000);
        },
        error: () => {
          this.errorMessage.set('❌ Erreur lors de la mise à jour');
          this.loading.set(false);
        }
      });
    } else {
      // Créer nouvelle
      this.prestataireService.createAnnonce(prestataire, data).subscribe({
        next: () => {
          this.successMessage.set('✅ Annonce publiée avec succès!');
          this.closeModal();
          this.loadAnnonces();
          setTimeout(() => this.successMessage.set(''), 3000);
        },
        error: () => {
          this.errorMessage.set('❌ Erreur lors de la création');
          this.loading.set(false);
        }
      });
    }
  }

  deleteAnnonce(id: number): void {
    if (confirm('Êtes-vous sûr de vouloir supprimer cette annonce ?')) {
      this.prestataireService.deleteAnnonce(id).subscribe({
        next: () => {
          this.successMessage.set('✅ Annonce supprimée!');
          this.loadAnnonces();
          setTimeout(() => this.successMessage.set(''), 2000);
        }
      });
    }
  }

  validateForm(): boolean {
    if (!this.nom_prestation().trim()) {
      this.errorMessage.set('Le nom est obligatoire');
      return false;
    }
    if (!this.description_presta().trim()) {
      this.errorMessage.set('La description est obligatoire');
      return false;
    }
    if (!this.prix() || parseFloat(this.prix()) <= 0) {
      this.errorMessage.set('Le prix doit être supérieur à 0');
      return false;
    }
    return true;
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }

  goToProfile(): void {
    this.router.navigate(['/profile']);
  }

  goToPrestations(): void {
    this.router.navigate(['/prestations']);
  }

  loadReservations(): void {
  const prestataireId = this.currentUser()?.id_utilisateur;

  if (!prestataireId) {
    return;
  }

  this.prestataireService.getReservationsByPrestataire(prestataireId)
    .subscribe({
      next: (data) => {
        this.reservations.set(data);
      },
      error: (err) => {
        console.error(err);
      }
    });
}

acceptReservation(id: number): void {
  this.prestataireService.acceptReservation(id).subscribe({
    next: () => {
      this.loadReservations();
    }
  });
}

refuseReservation(id: number): void {
  this.prestataireService.refuseReservation(id).subscribe({
    next: () => {
      this.loadReservations();
    }
  });
}
}
