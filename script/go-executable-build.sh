#!/usr/bin/env bash 

# Verifica se o usuário enviou o número mínimo de argumentos
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 [OPTION] name file [OPTION] dir main.go"
    exit 1
fi

# Exibe os parâmetros recebidos pelo script
echo -e "Command executed is: $0\nName to binary: $1\nDirectory reference: $2\n"

export package=$2
export os="linux"

export arch="amd64"
export out_filename=$1

# Verifica se o argumento do pacote Go foi fornecido
if [[ -z "$package" ]]; then
    echo "Argument for Go package not found, please provide it."
    exit 1
fi

# Tenta compilar o binário Go
env GOOS=$os GOARCH=$arch go build -o $out_filename $package

# Verifica se a compilação foi bem-sucedida
if [ $? -ne 0 ]; then
    echo 'An error occurred during the build! Aborting the script execution...'
    exit 1
fi

# Verifica se o binário foi gerado com sucesso
if [ ! -f "$out_filename" ]; then
    echo "Erro: binary $out_filename not found"
    exit 1
fi

# Verifica se o diretório 'build' existe; se não, cria-o
if [ ! -d "./build" ]; then
    echo "Build directory doesn't exist, creating it now..."
    mkdir ./build
else 
	echo "Build directory already exists."
	chmod +x ./build
	rm -r ./build
	mkdir ./build
fi	

chmod +w ./build

# Cria o arquivo zip contendo o binário
echo "executing: zip 'build/${out_filename}.zip' $out_filename"
zip "build/${out_filename}.zip" $out_filename

# Verifica se o zip foi criado com sucesso
if [ $? -eq 0 ]; then
    echo 'Zip was created successfully.'
else
    echo 'An error occurred while creating the zip file.'
    exit 1
fi

# Remove o binário que não está comprimido
rm -f $out_filename

# Confirma que o binário foi removido
echo 'Binary file removed.'
echo 'Build successful!'

exit 0




