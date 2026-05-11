import { Component, signal, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { LoginRequest } from '../../models/user.model';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  private authService = inject(AuthService);
  private router = inject(Router);

  email = signal('');
  password = signal('');
  loading = signal(false);
  error = signal('');

  demoUsers = [
    { email: 'admin@example.com', password: 'admin123', label: '👑 Admin' },
    { email: 'jean@example.com', password: 'password123', label: 'Client' },
    { email: 'marie@example.com', password: 'password456', label: 'Client' },
    { email: 'jean-paul@example.com', password: 'password789', label: 'Prestataire' },
    { email: 'sophie@example.com', password: 'password101', label: 'Prestataire' }
  ];

  onSubmit() {
    this.error.set('');
    
    if (!this.email() || !this.password()) {
      this.error.set('Veuillez remplir tous les champs');
      return;
    }

    this.loading.set(true);
    const loginRequest: LoginRequest = {
      email: this.email(),
      mot_de_passe: this.password()
    };

    this.authService.login(loginRequest).subscribe({
      next: (response) => {
        this.loading.set(false);
        if (response.accessToken) { // ← corrigé, était response.success
          const user = this.authService.currentUser();
          if (user?.role === 'Admin') {
            this.router.navigate(['/admin-dashboard']);
          } else if (user?.role === 'Manager') {
            this.router.navigate(['/prestataire-dashboard']);
          } else {
            this.router.navigate(['/prestations']);
          }
        } else {
          this.error.set(response.message ?? 'Erreur de connexion');
        }
      },
      error: () => {
        this.loading.set(false);
        this.error.set('Une erreur est survenue lors de la connexion');
      }
    });
  }

  goToRegister() {
    this.router.navigate(['/register']);
  }

  fillDemoCredentials(index: number) {
    this.email.set(this.demoUsers[index].email);
    this.password.set(this.demoUsers[index].password);
  }
}