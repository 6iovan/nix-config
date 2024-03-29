let
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDeubByBkPKvN7aj3d6Ce8FHeru3/D0bXxlj8YCVAeMz";
  users = [ user ];
in
{
  "ai-provider-key.env.age".publicKeys = users;
  "github-access-token.age".publicKeys = users;
}
