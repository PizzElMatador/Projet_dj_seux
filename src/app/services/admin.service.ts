import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, BehaviorSubject, of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { environment } from '../../environments/environment';

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
  id?: number;              // ← Ajouté (c'est l'ID mappé depuis la classe C# "Id")
  id_utilisateur?: number;  // ← Gardé pour compatibilité
  nom: string;
  prenom: string;
  email: string;
  id_role?: number;
  role?: 'Admin' | 'Manager' | 'User';
  is_banned: boolean;
  date_inscription: Date;
}

@Injectable({
  providedIn: 'root'
})
export class AdminService {
  private apiUrl = environment.apiUrl;
  
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
    return this.http.get<Reservation[]>(`${this.apiUrl}/Reservation/GetAll`).pipe(
        catchError(error => {
            console.error('Erreur:', error);
            return of([]);
        })
    );
}

  // Obtenir tous les utilisateurs pour gestion
 getAllUsers(): Observable<UserManagement[]> {
  return this.http.get<UserManagement[]>(`${this.apiUrl}/User/GetAll`).pipe(
    catchError(error => {
      console.error('Erreur:', error);
      return of([]);
    })
  );
}

  // Assigner un rôle à un utilisateur
  assignRole(userId: number, newRole: 'Admin' | 'Manager' | 'User'): Observable<{ success: boolean; message: string }> {
    const url = `${this.apiUrl}/User/UpdateRole?userId=${userId}&newRole=${newRole}`;
    console.log('Envoi requête POST vers:', url);
    return this.http.post<{ success: boolean; message: string }>(url, {}).pipe(
      catchError(error => {
        console.error('Erreur lors de la modification du rôle:', error);
        console.error('URL:', url);
        console.error('Status:', error.status);
        console.error('Message:', error.error?.message || error.statusText);
        return of({
          success: false,
          message: error.error?.message || `Erreur serveur (${error.status})`
        });
      })
    );
  }

  // Bannir/Débannir un utilisateur
  toggleBanUser(userId: number, ban: boolean): Observable<{ success: boolean; message: string }> {
    const action = ban ? 'Ban' : 'Unban';
    const url = `${this.apiUrl}/User/${action}?userId=${userId}`;
    console.log('Envoi requête POST vers:', url);
    return this.http.post<{ success: boolean; message: string }>(url, {}).pipe(
      catchError(error => {
        console.error(`Erreur lors du ${action.toLowerCase()}:`, error);
        console.error('URL:', url);
        console.error('Status:', error.status);
        console.error('Message:', error.error?.message || error.statusText);
        return of({
          success: false,
          message: error.error?.message || `Erreur serveur (${error.status})`
        });
      })
    );
  }

  // Supprimer un utilisateur
  deleteUser(userId: number): Observable<boolean> {
    return this.http.delete<boolean>(`${this.apiUrl}/User/Delete/${userId}`);
  }
}
