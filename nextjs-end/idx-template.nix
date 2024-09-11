{ pkgs, packageManager ? "npm", ... }: {
  packages = [
    pkgs.nodejs_20
    pkgs.j2cli
    pkgs.nixfmt
  ];
  bootstrap = ''
    npx -y giget gh:firebase/friendlyeats-web/nextjs-end#jamesdaniels_fixServiceWorkers "$WS_NAME"
    rm "$WS_NAME/idx-template".{nix|json}
    sed -e 's/<project-id>/${projectId}/' ${.idx/dev.nix} > "$WS_NAME/.idx/dev.nix"
    mv "$WS_NAME" "$out"
  '';
}