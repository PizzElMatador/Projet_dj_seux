import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { PrestationService } from '../../services/prestation.service';
import { AuthService } from '../../services/auth.service';
import { Prestation } from '../../models/prestation.model';

@Component({
  selector: 'app-prestations',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './prestations.component.html',
  styleUrls: ['./prestations.component.css']
})
export class PrestationsComponent implements OnInit {
  prestations = signal<Prestation[]>([]);
  loading = signal(true);
  currentUser = signal<any>(null);
  showReservationModal = signal(false);
  selectedPrestation = signal<Prestation | null>(null);
  
  // Form signals
  reservationDate = signal('');
  reservationHeure = signal('20:00');
  reservationLieu = signal('');
  reservationNombrePersonnes = signal(150);
  reservationBudget = signal('');
  reservationNotes = signal('');
  reservationPrenom = signal('');
  reservationNom = signal('');
  reservationEmail = signal('');
  reservationTelephone = signal('');

  constructor(
    private prestationService: PrestationService,
    private authService: AuthService,
    private router: Router
  ) {
    this.currentUser.set(this.authService.currentUser());
  }

  ngOnInit(): void {
    this.loadPrestations();
  }

  loadPrestations(): void {
    this.loading.set(true);
    this.prestationService.getPrestations().subscribe({
      next: (data) => {
        this.prestations.set(data);
        this.loading.set(false);
      },
      error: (err) => {
        console.error('Erreur lors du chargement des prestations', err);
        this.loading.set(false);
      }
    });
  }

  reserverPrestation(prestation: Prestation): void {
    this.selectedPrestation.set(prestation);
    // Données en dur pour tester
    this.reservationDate.set('2026-04-15');
    this.reservationHeure.set('20:00');
    this.reservationLieu.set('Plage de Tahiti - Motu');
    this.reservationNombrePersonnes.set(150);
    this.reservationBudget.set(Math.round(prestation.prix * 150).toString());
    this.reservationNotes.set('Nous cherchons une ambiance tropicale avec des hits des années 90 et 2000. Possibilité de pause entre 23h et 23h30.');
    this.reservationPrenom.set(this.currentUser()?.prenom || 'Jean');
    this.reservationNom.set(this.currentUser()?.nom || 'Dupont');
    this.reservationEmail.set(this.currentUser()?.email || 'jean.dupont@example.com');
    this.reservationTelephone.set('+689 40 12 34 56');
    this.showReservationModal.set(true);
  }

  closeReservationModal(): void {
    this.showReservationModal.set(false);
    this.selectedPrestation.set(null);
  }

  confirmReservation(): void {
  const prestation = this.selectedPrestation();
  const user = this.currentUser();

  console.log('prestation:', prestation);
console.log('id_prestation:', prestation?.id_prestation);

  if (!prestation || !user) {
    alert("Impossible de créer la réservation.");
    return;
  }

 const reservation = {
  Date_reservation: new Date().toISOString().split('T')[0],
  Date_prestation: this.reservationDate(),
  Rue: this.reservationLieu(),
  Code_postal: 0,
  Ville: 'Non renseignée',
  Id_prestation: prestation.id_prestation,
  Id_client: user.id_utilisateur
};

console.log('Réservation envoyée :', reservation);
console.log('Réservation envoyée :', JSON.stringify(reservation));

  this.prestationService.createReservation(reservation).subscribe({
    next: () => {
      alert('Réservation enregistrée avec succès !');
      this.closeReservationModal();
    },
    error: (err) => {
      console.error('Erreur réservation :', err);
      alert("Erreur lors de l'enregistrement de la réservation.");
    }
  });
}

  getStarArray(rating?: number): number[] {
    const stars: number[] = [];
    const rate = Math.round(rating || 0);
    for (let i = 1; i <= 5; i++) {
      stars.push(i <= rate ? 1 : 0);
    }
    return stars;
  }

  goToProfile(): void {
    this.router.navigate(['/profile']);
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}
