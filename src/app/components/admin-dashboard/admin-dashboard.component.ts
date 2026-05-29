import { Component, OnInit, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { AdminService, Reservation, UserManagement } from '../../services/admin.service';
import { Client } from '../../models/user.model';

@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css']
})
export class AdminDashboardComponent implements OnInit {
  currentUser = signal<Client | null>(null);
  reservations = signal<Reservation[]>([]);
  users = signal<UserManagement[]>([]);
  
  activeTab = signal<'reservations' | 'users'>('reservations');
  loading = signal(false);
  successMessage = signal('');
  errorMessage = signal('');

  selectedRoleChange = signal<{ userId: number; newRole: 'Admin' | 'Manager' | 'User' } | null>(null);
  selectedUserForBan = signal<{ userId: number; name: string } | null>(null);

  constructor(
    private authService: AuthService,
    private adminService: AdminService,
    private router: Router
  ) {}

  ngOnInit(): void {
    // Vérifier que l'utilisateur est admin
    const user = this.authService.currentUser();
    if (!user || user.role !== 'Admin') {
      this.router.navigate(['/']);
      return;
    }

    this.currentUser.set(user);
    this.loadReservations();
    this.loadUsers();
  }

  // Charger l'historique des réservations
 loadReservations(): void {
    this.loading.set(true);
    this.adminService.getReservationHistory().subscribe({
        next: (data) => {
            console.log('Réservations reçues:', data);
            this.reservations.set(data);
            this.loading.set(false);
        },
        error: (err) => {
            console.error('Erreur réservations:', err);
            this.errorMessage.set('Erreur lors du chargement des réservations');
            this.loading.set(false);
        }
    });
}

  // Charger tous les utilisateurs
  loadUsers(): void {
    this.loading.set(true);
    this.adminService.getAllUsers().subscribe({
      next: (data) => {
        //console.log('Utilisateurs chargés:', data);
        //console.log('Premier utilisateur:', data[0]);
        //console.log('Clés du premier utilisateur:', Object.keys(data[0]));
        this.users.set(data);
        this.loading.set(false);
      },
      error: (err) => {
        this.errorMessage.set('Erreur lors du chargement des utilisateurs');
        this.loading.set(false);
      }
    });
  }

  // Changer le rôle d'un utilisateur
  changeUserRole(userId: number, currentRole: string): void {
    console.log('changeUserRole appelé avec userId:', userId, 'currentRole:', currentRole);
    const roles: ('Admin' | 'Manager' | 'User')[] = ['Admin', 'Manager', 'User'];
    const currentIndex = roles.indexOf(currentRole as any);
    const newRole = roles[(currentIndex + 1) % roles.length];
    
    this.selectedRoleChange.set({ userId, newRole });
  }

  // Confirmer le changement de rôle
  confirmRoleChange(): void {
    const change = this.selectedRoleChange();
    if (!change) return;

    this.loading.set(true);
    this.adminService.assignRole(change.userId, change.newRole).subscribe({
      next: (response) => {
        console.log('Réponse du changement de rôle:', response);
        if (response.success) {
          this.successMessage.set(response.message);
          this.loadUsers();
          this.selectedRoleChange.set(null);
        } else {
          this.errorMessage.set(response.message || 'Erreur lors du changement de rôle');
        }
        this.loading.set(false);
      },
      error: (err) => {
        console.error('Erreur HTTP:', err);
        this.errorMessage.set('Erreur lors du changement de rôle');
        this.loading.set(false);
      }
    });
  }

  // Bannir/Débannir un utilisateur
  toggleBan(userId: number, userName: string, isBanned: boolean): void {
    this.selectedUserForBan.set({ userId, name: userName });
  }

  // Confirmer bannissement
  confirmBan(): void {
    const banInfo = this.selectedUserForBan();
    if (!banInfo) return;

    const user = this.users().find(u => (u.id || u.id_utilisateur) === banInfo.userId);
    const shouldBan = !user?.is_banned;

    this.loading.set(true);
    this.adminService.toggleBanUser(banInfo.userId, shouldBan).subscribe({
      next: (response) => {
        console.log('Réponse du bannissement:', response);
        if (response.success) {
          this.successMessage.set(response.message);
          this.loadUsers();
          this.selectedUserForBan.set(null);
        } else {
          this.errorMessage.set(response.message || 'Erreur lors du bannissement');
        }
        this.loading.set(false);
      },
      error: (err) => {
        console.error('Erreur HTTP bannissement:', err);
        this.errorMessage.set('Erreur lors du bannissement');
        this.loading.set(false);
      }
    });
  }

  // Changer d'onglet
  switchTab(tab: 'reservations' | 'users'): void {
    this.activeTab.set(tab);
    this.successMessage.set('');
    this.errorMessage.set('');
  }

  // Fermer les modales
  closeBanModal(): void {
    this.selectedUserForBan.set(null);
  }

  closeRoleModal(): void {
    this.selectedRoleChange.set(null);
  }

  // Logout
  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }
}
