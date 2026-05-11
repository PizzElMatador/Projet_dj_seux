import { Injectable, signal } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable, tap, catchError, of } from 'rxjs';
import { LoginRequest, RegisterRequest, AuthResponse, Client } from '../models/user.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = environment.apiUrl;
  
  private currentUserSubject = new BehaviorSubject<Client | null>(null);
  public currentUser$ = this.currentUserSubject.asObservable();
  
  isAuthenticated = signal(false);
  currentUser = signal<Client | null>(null);

  constructor(private http: HttpClient) {
    this.loadUserFromStorage();
  }

  private loadUserFromStorage() {
    const user = localStorage.getItem('user');
    const token = localStorage.getItem('token');
    if (user && token) {
      const userData = JSON.parse(user);
      this.currentUser.set(userData);
      this.currentUserSubject.next(userData);
      this.isAuthenticated.set(true);
    }
  }

  login(request: LoginRequest): Observable<AuthResponse> {
    return this.http.post<any>(`${this.apiUrl}/Auth/Login`, {
      email: request.email,
      password: request.mot_de_passe
    }).pipe(
      tap(response => {
        if (response.accessToken) {
          localStorage.setItem('token', response.accessToken);
          localStorage.setItem('refreshToken', response.refreshToken);
          
          const client: Client = {
            id: response.user?.id || 0,
            id_utilisateur: 0,
            nom: response.user?.lastName || '',
            prenom: response.user?.firstName || '',
            email: response.user?.email || request.email,
            date_inscription: new Date(),
            id_role: response.user?.roles?.includes('Admin') ? 1 : 
                      response.user?.roles?.includes('Prestataire') ? 2 : 3,
            role: response.user?.roles?.includes('Admin') ? 'Admin' : 
                  response.user?.roles?.includes('Prestataire') ? 'Manager' : 'User',
            is_banned: false
          };
          
          localStorage.setItem('user', JSON.stringify(client));
          this.currentUser.set(client);
          this.currentUserSubject.next(client);
          this.isAuthenticated.set(true);
        }
      }),
      catchError(error => {
        console.log('LOGIN STATUS:', error.status);
        console.log('LOGIN ERREUR:', error.error);
        console.log('LOGIN MESSAGE:', error.message);
        this.isAuthenticated.set(false);
        return of({
          success: false,
          message: error.error?.message || 'Erreur de connexion'
        } as AuthResponse);
      })
    );
  }

  register(request: RegisterRequest): Observable<AuthResponse> {
    return this.http.post<any>(`${this.apiUrl}/Auth/Register`, {
      email: request.email,
      password: request.password,
      firstName: request.prenom,
      lastName: request.nom
    }).pipe(
      tap(response => {
        if (response.accessToken) {
          localStorage.setItem('token', response.accessToken);
          localStorage.setItem('refreshToken', response.refreshToken);
          
          const client: Client = {
            id: response.user?.id || 0,
            id_utilisateur: 0,
            nom: response.user?.lastName || request.nom,
            prenom: response.user?.firstName || request.prenom,
            email: request.email,
            date_inscription: new Date(),
            id_role: 3,
            role: 'User',
            is_banned: false
          };
          
          localStorage.setItem('user', JSON.stringify(client));
          this.currentUser.set(client);
          this.currentUserSubject.next(client);
          this.isAuthenticated.set(true);
        }
      }),
      catchError(error => {
        console.log('STATUS:', error.status);
        console.log('ERREUR:', error.error);
        return of({
          success: false,
          message: error.error?.message || 'Erreur d\'inscription'
        } as AuthResponse);
      })
    );
  }

  getCurrentUser(): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/Auth/Me`);
  }

  logout(): void {
    localStorage.removeItem('user');
    localStorage.removeItem('token');
    localStorage.removeItem('refreshToken');
    this.currentUser.set(null);
    this.currentUserSubject.next(null);
    this.isAuthenticated.set(false);
  }

  updateUser(updatedUser: Client): void {
    localStorage.setItem('user', JSON.stringify(updatedUser));
    this.currentUser.set(updatedUser);
    this.currentUserSubject.next(updatedUser);
  }

  getToken(): string | null {
    return localStorage.getItem('token');
  }
}