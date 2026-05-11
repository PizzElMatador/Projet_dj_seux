import { Routes } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { PrestationsComponent } from './components/prestations/prestations.component';
import { ProfileComponent } from './components/profile/profile.component';
import { PrestataireDashboardComponent } from './components/prestataire-dashboard/prestataire-dashboard.component';
import { AdminDashboardComponent } from './components/admin-dashboard/admin-dashboard.component';

export const routes: Routes = [
  {
    path: '',
    component: LoginComponent
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: 'register',
    component: RegisterComponent
  },
  {
    path: 'prestations',
    component: PrestationsComponent
  },
  {
    path: 'profile',
    component: ProfileComponent
  },
  {
    path: 'prestataire-dashboard',
    component: PrestataireDashboardComponent
  },
  {
    path: 'admin-dashboard',
    component: AdminDashboardComponent
  },
  {
    path: '**',
    redirectTo: '/login'
  }
];
