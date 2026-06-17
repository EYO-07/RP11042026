/// BEGIN 

// ========================================================================================================
// Analysis | Dialetics

* Quais as vantagens de uma instalação mínima customizada ? 
1. Controle || Aprendizado, Customização
2. Debloat 
3. Performance 

{ * O que é Linux ?
** O que é um Sistema Operacional ? 
*** O que é um Kernel ?
*** O que é um Ambiente Desktop ?
* O que é Debian ?
** O que são distribuições Linux ? 
}
{ * Como criar uma mídia de instalação para netinst do Debian ?
** O que é uma mídia bootável ?
:: Simula um dispositivo primário que é lido pelo computador para inicializar sistemas operacionais. 
*** Como inicializar uma mídia bootável ?
::: Entra na bios e mudar a ordem de prioridade de inicialização de unidades.
**** Como configurar a ordem de prioridade de inicialização de unidades de armazenamento ? 
* Ferramentas de criação de mídia bootável
** Como funciona a ferramenta rufus e balena etcher ? 
*** O que é modo de gravação dd ? 
::: Disk Dump, cópia idêntica preservando a estrutura. 
**** Pq o modo DD é importante para instalação de certas distros ? 
*** O que é modo ISO ? 
::: Extrai e cria uma nova tabela de partição. 
** Como funciona a ferramenta ventoy ?
*** É possível colocar arquivos comuns na raiz do usb com ventoy instalado ?
** Quais outras ferramentas são interessantes para ter em uma mídia bootável ?
}
{ * Quais problemas comuns com adaptadores de rede wifi ?
1. Hardware Block ~ sudo rfkill unblock wifi, rfkill list 
2. Interferência de Servidores de Gerenciamento de Rede 
3. Chipsets não suportados nativamente pelo sistema 
** Como checar por problemas em linux ?
:: 1. lspci --nn ; mostra os dispositivos 
:: 2. lspci -k ; mostra os dispositivos e detalhes
*** Como usar dmesg e grep para coletar informações de erro ? 
:: sudo dmesg | grep -iE "error|critical|failed|failure" | tee ~/errors.txt
** Como resolver problemas de adaptadores de rede ?
:: 1. Atualização de Firmware
:: 2. Blacklist de drivers incompatíveis
*** Como editar blacklists de drivers ?
::: sudo update-initramfs -u
::: sudo reboot   
*** Como desativar suspensão de wifi da política de gerenciamento de energia ?
}
{ * Quais os problemas mais comuns de áudio em linux ?
1. Ausência de Som 
2. Som baixo 
3. Problemas de Taxas de Amostragem 
** Quais abordagens para resolver os problemas de áudio em linux ?
:: Verificar a saída sink, Verificar se o sink corresponde a saída de som utilizada 
:: Verificar o som com alsamixer 
:: Verificar arquivos de configuração 
*** Onde ficam os arquivos de configuração que podem dar problema ? 
}
{ * Como usar o GPARTED ?
** Como inicializar o gparted via terminal ?
*** Como analisar os espaços disponíveis ?
**** Como identificar espaços não-alocados ?
**** Como identificar partições primárias ?
**** Como identificar partições estendidas ?
**** Como identificar partições lógicas ? 
** Como funciona a execução de operações no gparted ? 
*** Quais operações podem ser feitas no gparted ?
*** Quais operações são mais arriscadas ?
}
* Para que serve o /etc/fstab ?
** Como editar para montagem automática de partições ? 

{ XLibre }
* Quais as diferenças entre XLibre e XOrg ?
* É possível aproveitar as configurações do XOrg no XLibre ? 
    
1. Minimalismo
2. Modularidade 
> Controle, Customização, Performance 

{ Arch Linux }
* Como usar o blacklist do modprobe para o instalador do arch linux ? 
* Quais os drivers de wifi mais comuns para o blacklist ? 
1. b43
2. brcmsmac
3. b43legacy
4. ssb
5. bcma
6. brcmfmac
7. 

* Para que serve o arch-chroot ?
* É necessário para instalação ? 
** Não é possível apenas bootar o novo sistema ? 

* Para que ser o pacstrap ?
* É possível instalar todos os pacotes com o pacstrap ? 
* É possível executar pacstrap para um pacote e em seguida pacstrap para outro pacote ? 

* genfstab é feito antes ou depois do arch-chroot ?


// ========================================================================================================
// Prompts

{ // Inventory [ initramfs ] { Linux }

Context: linux, debian
Problem: can you expand this inventory?
    
# Inventory [ initramfs ] { Linux }
# 1. SYNTAX // SHORT_DESCRIPTION 
    
Constraints:
1. Keep the comment block style.
2. Output as a code.
    
}

{ // Inventory : comandos do instalador { Arch Linux }

> Contexto : Arch Linux, Instalação
> Problema : pode criar este inventário 
    
# Inventário : comandos do instalador { Arch Linux }
# 1. ping archlinux.org ; testa a conexão com o site do archlinux 
    
> Restrições :
1. mantenha o estilo de bloco de comentários em bash.
2. retorne como código para ser copiado em um arquivo bash como documentação.
3. as linhas são numeradas, com um objeto à esquerda e a explicação à direita separados por ';'
4. o objeto pode ser uma sintaxe para um comando 
5. as explicações devem ser concisas
    
}


// ========================================================================================================
// Outros 

{ // 19052026
    
* O que é Linux ?
** O que é um Sistema Operacional ? 
*** O que é um Kernel ?
*** O que é um Ambiente Desktop ?
**** O que é um servidor gráfico ?
**** O que é um gerenciador de janelas ? 
**** O que é um compositor de janelas ?
* O que é Debian-Linux ?
** O que são distribuições Linux ? 
    
* Como instalar um sistema operacional linux no virtual box ?
** Como criar uma máquina virtual ?
** Como configurar os recursos de hardware da máquina virtual ? 
** Como selecionar a distribuição linux de uma máquina virtual ? 
* Como inicializar a máquina virtual ?
* Como sair do modo de captura da máquina virtual ? 

* O que é formatação ? O que é espaço não-alocado ?
** O que é um sistema de arquivos ?
* O que são partições ? 
* Como partições são identificadas em Linux e em Windows ?
* Quais partições são interessantes para configurar durante a instalação linux ? 
* Como criar uma nova partição ?
* O que são partições primárias e o que são partições lógicas ? 
** Como criar um espaço não-alocado ? 
** Como criar uma partição formatada a partir de um espaço não-alocado ?
** Quais os tipos de formatos de partição e para quê servem ? 

* O que são sistemas UEFI ?
* Qual a diferença entre UEFI e Legacy BIOS ?
* Como saber qual sistema está ativo ? 
* Qual a relação entre MDR, GPT e UEFI ? 
* O que é o modo de compatibilidade CSM ?

* O que são terminais virtuais tty ?
* Como alternar entre terminais virtuais em linux ?
* Qual a diferença entre emuladores de terminais virtuais e terminais virtuais ?
* O que é initframs ? 

* Como instalar programas em linux ?
** O que é apt, apt-get, dpkg e .deb em linux ?  
** Onde é configurado os repositórios do apt ? 
** Como acessar e editar os repositórios do apt ? 
*** Onde estão localizados os arquivos com a lista de repositórios ? 
* Quais as práticas de segurança ao instalar aplicativos em linux ?
** Quais as práticas de segurança ao instalar aplicativos open-source ?
** O que são checksums ?
*** Quais comandos para calcular checksums em linux ? 

* O que são projetos de código-aberto ?
** O que é compilação ?
** Como compilar um projeto a partir de seu código-fonte ? 

    
}

& Inspiração || Leitura | Dialética | Escrita 
& Inspiração || Leitura || % Inibição || Leitura em Voz Alta 




















    
/// END    