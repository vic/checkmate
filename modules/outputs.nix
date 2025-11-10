{ ... }:
{
  flake-file.inputs.target.url = "github:vic/empty-flake";
  flake.templates.default = {
    description = "Success flake";
    path = ../templates/success;
  };
}
