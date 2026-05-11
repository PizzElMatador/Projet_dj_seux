import { Component, signal, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { RegisterRequest } from '../../models/user.model';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent {
  private authService = inject(AuthService);
  private router = inject(Router);

  nom = signal('');
  prenom = signal('');
  email = signal('');
  password = signal('');
  confirmPassword = signal('');
  agreeTerms = signal(false);
  loading = signal(false);
  error = signal('');
  success = signal('');

  onSubmit() {
    this.error.set('');
    this.success.set('');

    if (!this.nom() || !this.prenom() || !this.email() || !this.password() || !this.confirmPassword()) {
      this.error.set('Veuillez remplir tous les champs');
      return;
    }

    if (!this.agreeTerms()) {
      this.error.set('Vous devez accepter les conditions d\'utilisation');
      return;
    }

    if (this.password().length < 8) {
      this.error.set('Le mot de passe doit contenir au moins 8 caractères');
      return;
    }

    if (this.password() !== this.confirmPassword()) {
      this.error.set('Les mots de passe ne correspondent pas');
      return;
    }

    this.loading.set(true);

    const registerRequest: RegisterRequest = {
      nom: this.nom(),
      prenom: this.prenom(),
      email: this.email(),
      password: this.password(),           // ← corrigé
      confirmPassword: this.confirmPassword()
    };

    this.authService.register(registerRequest).subscribe({
      next: (response) => {
        this.loading.set(false);
        if (response.accessToken) {
          this.success.set('Inscription réussie ! Redirection...');
          setTimeout(() => {
            this.router.navigate(['/dashboard']);
          }, 1500);
        } else {
          this.error.set(response.message ?? 'Erreur inconnue');
        }
      },
      error: () => {
        this.loading.set(false);
        this.error.set('Une erreur est survenue lors de l\'inscription');
      }
    });
  }

  goToLogin() {
    this.router.navigate(['/login']);
  }
}