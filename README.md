# Disaster Early-Warning System · Mobile app

Flutter prototype of the citizen app for the Santa Cruz disaster early-warning system: people check alerts by event type and report emergencies from the field with their location, photos and video.

This repository is the mobile half of the system. The web platform and API live in [alerta-temprana-scz](https://github.com/Diego785/alerta-temprana-scz).

## Context

Built in March 2023 during a three-day hackathon, together with a teammate. It was the starting point of the early-warning system later developed for the Santa Cruz Departmental Government.

## Features

- **Home menu** with large shortcuts: send an alert, see alerts, contact and share.
- **Alerts by category.** Event types shown as illustrated cards, each opening its list of alerts.
- **Field report form.** Choose the event type (fire, flood, drought), save the current GPS location, and attach photos and a video from the camera or gallery.
- **Sign in and sign up** screens.

## Tech stack

Flutter · Dart · Provider · Geolocator · Image Picker · HTTP · Animate Do · Font Awesome

## How it works

Screens are plain Flutter widgets with Provider for shared state. Models mirror the web platform's data (alerts, events, alert levels, municipalities, units). As a hackathon prototype, part of the data is still local and the API calls point to a local development server.

## Run locally

```bash
flutter pub get
flutter run
```

Uses Dart SDK 2.19+. To connect it to the web platform, run [alerta-temprana-scz](https://github.com/Diego785/alerta-temprana-scz) locally; the Android emulator reaches it at `10.0.2.2:8000`.

## Author

Diego Hurtado Vargas · [GitHub](https://github.com/Diego785) · [LinkedIn](https://www.linkedin.com/in/diegohurtadovargas/)
