import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject, of } from 'rxjs';
import { catchError } from 'rxjs/operators';

export interface Reservation {
  id_reservation: number;
  date_reservation: Date;
  date_prestation: Date;
  rue: string;
  code_postal: number;
  ville: string;
  id_prestation: number;
  id_client: number;
  nom_prestation?: string;
  client_nom?: string;
  client_prenom?: string;
}

export interface UserManagement {
  id_utilisateur: number;
  nom: string;
  prenom: string;
  email: string;
  id_role: number;
  role?: 'Admin' | 'Manager' | 'User';
  is_banned: boolean;
  date_inscription: Date;
}

@Injectable({
  providedIn: 'root'
})
export class AdminService {
  private apiUrl = 'https://localhost:7051';
  
  private reservationHistory = new BehaviorSubject<Reservation[]>([]);
  public reservationHistory$ = this.reservationHistory.asObservable();

  private allUsers = new BehaviorSubject<UserManagement[]>([]);
  public allUsers$ = this.allUsers.asObservable();

  constructor(private http: HttpClient) {
    this.loadData();
  }

  private loadData(): void {
    this.getReservationHistory().subscribe(data => {
      this.reservationHistory.next(data);
    });

    this.getAllUsers().subscribe(data => {
      this.allUsers.next(data);
    });
  }

  // Charger l'historique des réservations
  getReservationHistory(): Observable<Reservation[]> {
    // TODO: Créer un ReservationController
    return of([]);
  }

  // Obtenir tous les utilisateurs pour gestion
  getAllUsers(): Observable<UserManagement[]> {
    return this.http.get<any[]>(`${this.apiUrl}/User/Search`).pipe(
      catchError(error => {
        console.error('Erreur:', error);
        return of([]);
      })
    );
  }

  // Assigner un rôle à un utilisateur
  assignRole(userId: number, newRole: 'Admin' | 'Manager' | 'User'): Observable<{ success: boolean; message: string }> {
    // TODO: Ajouter un endpoint pour assigner un rôle
    return of({
      success: true,
      message: `Rôle ${newRole} assigné avec succès à l'utilisateur ${userId}`
    });
  }

  // Bannir/Débannir un utilisateur
  toggleBanUser(userId: number, ban: boolean): Observable<{ success: boolean; message: string }> {
    // TODO: Ajouter un endpoint pour ban/unban
    const action = ban ? 'banni' : 'débanni';
    return of({
      success: true,
      message: `L'utilisateur a été ${action} avec succès`
    });
  }

  // Supprimer un utilisateur
  deleteUser(userId: number): Observable<boolean> {
    return this.http.delete<boolean>(`${this.apiUrl}/User/Delete/${userId}`);
  }
}
