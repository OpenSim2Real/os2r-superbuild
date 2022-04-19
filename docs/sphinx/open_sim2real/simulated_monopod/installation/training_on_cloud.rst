.. _training_on_cloud:

Training on Cloud
=================


Instance Details
----------------
Training on cloud requires access to an instance. During the development of this
project we used the Google Cloud Computing (GCP) free trial. The instance was
setup with ``Ubuntu 20.04 LTS`` and 20GB memory. Training using :ref:`gym-os2r` is
designed to run on CPU. Therefore it is highly recommend to setup your instance
without gpu and instead more than eight cores of CPU.


Setting up Instance
-------------------

Bash script showing setup procedure can be found `here <https://github.com/OpenSim2Real/OS-setup/blob/main/setup_instance.sh>`_.

To setup the instance with current release of :ref:`gym-os2r` follow the procedure below,

.. code-block:: bash

  # Install Ignition Fortress
  sudo apt-get update
  sudo apt-get install lsb-release wget gnupg
  sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y ignition-fortress

  # Set Env variable for ignition
  echo 'export IGN_GAZEBO_PHYSICS_ENGINE_PATH=${IGN_GAZEBO_PHYSICS_ENGINE_PATH}:/usr/lib/x86_64-linux-gnu/ign-physics-5/engine-plugins/' >> ~/.bashrc

  # Install misc instance dependencies
  sudo apt-get install -y python3-pip swig screen build-essential libeigen3-dev libxml2-dev coinor-libipopt-dev libassimp-dev libirrlicht-dev
  pip install --upgrade pip

  # Pip install gym
  pip install gym==v0.21.0
  pip install --pre scenario gym-ignition

  # Install gym-os2r (replace this line with developer install if you want developer mode)
  pip install git+https://github.com/OpenSim2Real/gym-os2r.git


recommended miscellaneous installations for reinforcement learning training.

.. code-block:: bash

  # pip install torch
  pip install torch torchvision torchaudio

  # Pip install Wandb and log in
  echo "Please copy the authorization key from wandb and paste it into your command line when asked to authorize your account."
  echo ""
  echo "After completing click enter to continue."

  read -p "After reading instructions. Press enter to continue" yn
  pip install wandb
  wandb login

Install developer :ref:`gym-os2r`. Replace the pip installation of :ref:`gym-os2r` with the following,

.. code-block:: bash

  git config --global user.name $USER_NAME
  git config --global user.email $USER_GITHUB_EMAIL


  echo "Generate SSH key for github."
  echo ""
  echo "In next step you can press enter three times. No need for a password unless you want one..."

  read -p "After reading instructions. Press enter to continue" yn


  ssh-keygen -t ed25519 -C $USER_GITHUB_EMAIL
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519

  echo "Please copy the SSH key below and paste it into your github ssh keys."
  echo ""

  cat ~/.ssh/id_ed25519.pub

  read -p "After added ssh key to github. Press enter to continue" yn

  mkdir ~/workspace
  cd ~/workspace
  git clone git@github.com:OpenSim2Real/gym-os2r.git

  cd gym-os2r
  pip install -e .

Now to train your super sick smexy algorithms using :ref:`gym-os2r` please look at
:ref:`sim_quick_start` or :ref:`sim_next_steps` for a introduction on how to use
our simulation platform.
