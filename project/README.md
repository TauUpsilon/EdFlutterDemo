# Getting Started

The flutter is managed by FVM (Flutter Version Management) so the FVM should be installed to setup this project. You may find the way of installation through this link https://fvm.app/docs/getting_started/installation.

## Setup FVM

With the FVM installed, you want install the flutter version with the commend below:

### Install

	fvm install {version} - # Installs specific version.

### Use

	fvm use {version} - # Set cuurent use version

------------

You may want to see more detail through link below
https://fvm.app/docs/guides/basic_commands

For more setup including vscode config, you may want to watch vedio below
https://www.youtube.com/watch?v=v9iRjM-K1SM&list=PLVnlSO6aQelAAddOFQVJNoaRGZ1mMsj2Q&t=14s

## Setup Reflectable

Before you run this project, you may want to build the Reflectable classes set in this project. This project uses a mirror technology to call static methods when it comes to a function taking generic type input.

As we use FVM to manage our flutter version so you may want run the commend below to generate the Reflectable script.

    fvm flutter packages pub run build_runner build lib