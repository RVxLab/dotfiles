{ vars, pkgs, ... }:
{
  home-manager.users.${vars.username} = {
    home.packages = with pkgs; [
      # Basics
      curl
      wget

      # General CLI utils
      bat # Better cat
      eza # Better ls
      dust # Better du
      fd # Better find
      httpie # User-friendly HTTP tool
      just # Task runner
      jq # JSON manipulation
      ripgrep # Better grep
      tre-command # Better tree
      zoxide # Jump to known directories

      # Git
      difftastic # Diff and with syntax highlighting
      delta # Git pager
      lazygit # Git CLI tool

      # Shell
      starship
    ];

    programs = {
      direnv = {
        # Enable Direnv
        enable = true;
        nix-direnv.enable = true;

        # Integrate with Zsh
        enableZshIntegration = true;
      };

      # Allow Home Manager to manage zsh
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        # Set up aliases
        shellAliases = {
          # General aliases
          ls = "eza -lag --header";
          ll = "eza -lag --header";
          cat = "bat";
          fzf = "fzf --preview 'bat {}'";
          lg = "lazygit";

          # PHP
          a = "php artisan";
        };
      };

      # Install fzf
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };

      # Install Zoxide
      zoxide = {
        enable = true;
        enableZshIntegration = true;
      };

      # Install Starship
      starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          add_newline = false;
          format = "$username$hostname$directory$git_branch$git_state$git_status$git_metrics$fill\${custom.laravel}$php$rust$nodejs$cmd_duration $jobs $time$line_break$character";

          nodejs = {
            format = "[$symbol($version )]($style)";
          };

          php = {
            format = "[$symbol($version )]($style)";
          };

          fill = {
            symbol = " ";
          };

          directory = {
            style = "blue";
            read_only = " ";
            truncation_length = 4;
            truncate_to_repo = false;
          };

          character = {
            success_symbol = "[❯](blue)";
            error_symbol = "[❯](red)";
            vicmd_symbol = "[❮](green)";
          };

          git_branch = {
            symbol = " ";
            format = "[$symbol$branch]($style) ";
            style = "bright-black";
          };

          jobs = {
            symbol = "";
            style = "bold red";
            number_threshold = 1;
            format = "[$symbol]($style)";
          };

          git_status = {
            style = "cyan";
          };

          git_state = {
            format = "'\([$state( $progress_current/$progress_total)]($style)\) '";
            style = "bright-black";
          };

          git_metrics = {
            disabled = false;
          };

          cmd_duration = {
            format = "[$duration]($style)";
            style = "yellow";
          };

          memory_usage = {
            symbol = " ";
          };

          rust = {
            symbol = " ";
            format = "[$symbol($version )]($style)";
          };

          time = {
            disabled = false;
            style = "bold white";
            format = "[$time ]($style)";
          };

          # Custom entries
          custom = {
            laravel = {
              when = "test -d vendor/laravel/framework";
              description = "Shows the current Laravel version";
              style = "bold red";
              symbol = "L";
              command = "jq -r '.packages[] | select(.name == \"laravel/framework\") | .version' composer.lock";
              format = "[$symbol $output ]($style)";
            };

            stunnel = {
              when = "ps aux | grep stunnel | grep -v grep";
              command = "ps -o etime= -p $(ps aux | grep stunnel | grep -v grep | awk '{print $2}')";
              style = "red";
              format = "[TUNNEL OPEN for $output]($style)";
            };
          };
        };
      };
    };
  };
}
