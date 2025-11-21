{
  flake.templates.default = {
    description = "Success";
    path = ../templates/success;
  };
  flake.templates.dendritic = {
    description = "Dendritic";
    path = ../templates/dendritic;
  };
  flake.flakeModule =
    { inputs, ... }:
    {
      imports = [
        (inputs.import-tree ./checkmate)
      ];
    };
}
