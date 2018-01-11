/*
 * This file is part of MXE. See LICENSE.md for licensing information.
 */

#include <libp11.h>

#include <stdio.h>

int
main(int argc, char *argv[])
{
  (void) argc;
  (void) argv;

  PKCS11_CTX *ctx = PKCS11_CTX_new();

  if (!ctx) {
    print("Could not create PKCS11 context!\n");
    return 1;
  }

  printf("Successfully created PKCS11 context!\n");

  PKCS11_CTX_free(ctx);

  return 0;
}
