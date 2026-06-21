// ── Login modal link ─────────────────────────────────────────────────────────

.discourse-join-login-link {
  display: block;
  text-align: center;
  margin-top: 0.75em;

  &--button {
    // inherits .btn .btn-flat styles from Discourse core
  }

  &--text {
    font-size: 0.9em;
    color: var(--primary-medium);

    &:hover {
      color: var(--primary);
      text-decoration: underline;
    }
  }
}

// Pantalla de presentación (.static-login): el contenedor usa flexbox,
// hay que asignar order para que el enlace aparezca debajo de los botones.
.static-login .login-welcome .discourse-join-login-link {
  order: 4;
}

// ── Header link ──────────────────────────────────────────────────────────────

.discourse-join-header-link {
  &--button {
    // inherits .btn .btn-small .btn-default styles from Discourse core
  }

  &--text {
    font-size: 0.9em;
    color: var(--header_primary);
    align-self: center;
    margin-inline: 0.5em;

    &:hover {
      color: var(--header_primary);
      text-decoration: underline;
    }
  }
}
