## Script Instalação e Configuração da Função de DHCP - Créditos Gabriel Luiz - www.gabrielluiz.com ##


Install-WindowsFeature -Name DHCP -IncludeManagementTools -Restart # Instalação do Função de DHCP.

Install-WindowsFeature -Name RSAT-DHCP # Instalação da Ferramenta de Gerenciamento Remoto da Função de DHCP.

Add-DhcpServerInDC -DnsName DHCP.contoso.local -IPAddress 10.101.0.155 # Autoriza o servidor DHCP no Active Directory.

Set-ItemProperty -Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 -Name ConfigurationState -Value 2 # Remove o aviso do Servidor DHCP no Gerenciador do Servidor.

Add-DhcpServerv4Scope -EndRange 10.101.0.99 -Name "Contoso DHCP" -StartRange 10.101.0.1 -SubnetMask 255.255.255.0 # Cria o escopo de range de IPs para servidor DHCP disbribuir.

Set-DhcpServerV4OptionValue -ScopeId 10.101.0.0 -DnsServer 10.101.0.100 -DnsDomain contoso.local -Router 10.101.0.200 # Adiciona o IP do servidor DNS e o Gateway ao escopo.

Get-DhcpServerV4Scope # Verifica o escopo criado.

Get-DhcpServerV4Scope 10.101.0.0  # Verifica o escopo criado atráves do ID do escopo.