import subprocess
import platform
import os

def is_mysql_installed():
    try:
        subprocess.run(["mysql", "--version"], check=True)
        return True
    except subprocess.CalledProcessError:
        return False

def install_mysql(mysql_installer_path):
    subprocess.run([mysql_installer_path])

def create_database_from_dump(username, dump_file_path):
    command = f"mysql -u {username} -p < {dump_file_path}"
    subprocess.run(command, shell=True)

def main():
    if not is_mysql_installed():
        print("MySQL is not installed.")
        system = platform.system()
        if system == "Linux":
            subprocess.run(["sudo", "apt-get", "update"])
            subprocess.run(["sudo", "apt-get", "install", "mysql-server"])
        elif system == "Windows":
            mysql_installer_path = input("Enter the path to MySQL installer on Windows: ")
            if not os.path.exists(mysql_installer_path):
                print("Invalid path to MySQL installer. Please provide a valid path.")
                return

            print("Installing MySQL...")
            install_mysql(mysql_installer_path)
    else:
        print("MySQL is already installed.")

    username = input("Enter MySQL username: ")

    dump_file_path = input("Enter the path to your MySQL dump file: ")
    
    print("Creating database from dump...")
    create_database_from_dump(username, dump_file_path)

if __name__ == "__main__":
    main()
