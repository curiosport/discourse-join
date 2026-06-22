import Component from "@glimmer/component";
import { service } from "@ember/service";
import { withPluginApi } from "discourse/lib/plugin-api";

// ── Link inside the login modal ──────────────────────────────────────────────

class DiscourseJoinLoginLink extends Component {
  @service siteSettings;

  get enabled() {
    return this.siteSettings.discourse_join_enabled;
  }

  get url() {
    return this.siteSettings.discourse_join_url || "/apply";
  }

  get label() {
    return this.siteSettings.discourse_join_label || "Apply to join";
  }

  get isButton() {
    return this.siteSettings.discourse_join_style === "button";
  }

  <template>
    {{#if this.enabled}}
      {{#if this.isButton}}
        <a href={{this.url}} class="btn btn-flat discourse-join-login-link discourse-join-login-link--button">
          {{this.label}}
        </a>
      {{else}}
        <a href={{this.url}} class="discourse-join-login-link discourse-join-login-link--text">
          {{this.label}}
        </a>
      {{/if}}
    {{/if}}
  </template>
}

// ── Link in the site header (only shown to logged-out visitors) ──────────────

class DiscourseJoinHeaderLink extends Component {
  @service siteSettings;
  @service currentUser;

  get enabled() {
    return this.siteSettings.discourse_join_enabled && !this.currentUser;
  }

  get url() {
    return this.siteSettings.discourse_join_url || "/apply";
  }

  get label() {
    return this.siteSettings.discourse_join_label || "Apply to join";
  }

  get isButton() {
    return this.siteSettings.discourse_join_style === "button";
  }

  <template>
    {{#if this.enabled}}
      {{#if this.isButton}}
        <a href={{this.url}} class="btn btn-small btn-default discourse-join-header-link discourse-join-header-link--button">
          {{this.label}}
        </a>
      {{else}}
        <a href={{this.url}} class="discourse-join-header-link discourse-join-header-link--text">
          {{this.label}}
        </a>
      {{/if}}
    {{/if}}
  </template>
}

// ── Registration ─────────────────────────────────────────────────────────────

export default {
  name: "discourse-join",

  initialize() {
    withPluginApi((api) => {
      // Below the Log In / Sign Up buttons inside the login modal
      // api.renderInOutlet("login-after-modal-footer", DiscourseJoinLoginLink);
      api.renderInOutlet("below-login-buttons", DiscourseJoinLoginLink);
      
      // In the site header, after the auth buttons
      api.headerButtons.add(
        "discourse-join",
        DiscourseJoinHeaderLink,
        { after: "auth" }
      );
    });
  },
};
