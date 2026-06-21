# frozen_string_literal: true

# name: discourse-join
# about: Adds a customizable "Apply to join" link in the login modal and site header for private Discourse forums.
# version: 1.0.0
# authors: Your Name
# url: https://github.com/curiosport/discourse-join
# required_version: 2.7.0

register_asset "stylesheets/discourse-join.scss"

enabled_site_setting :discourse_join_enabled
