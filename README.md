SETUP GUIDE
===========

Ensure that you have python3

venv module is optional. If you are running the loader via disposable ec2 instance then this isn't necessary.
If using venv, install, create, and activate it
```
# sudo apt install python3-venv
# python3 -m venv venv
# . venv/bin/activate
```

You can exit the virtual environment by running `deactivate`.

Regardless of venv or not, on your first usage of the scripts, install required libraries:

```
# pip install -r requirements.txt
```

Below are commands I had to run in order to get EC2 set up to run python3, pip, etc.
```
sudo yum install python3
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py --user
pip install -r requirements.txt --user
```

Now you can either run fake-data.py in a single thread to load some data. Or you can run fake-data-loader.sh to run many threads of fake-data.py in parallel. Look at the either of the files to get example commands and parameters.
