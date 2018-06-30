#Author: nkatwesigye@gmail.com
#expose post patching reboot_status on puppetboard on Ubuntu & Debian systems
if Facter.value(:osfamily) != 'windows'
Facter.add('reboot_required') do
  
   if (Facter.value(:os)['name'] == 'Ubuntu' and  File.file?('/var/run/reboot-required'))
      reboot_required='YES'
  else
      if system("which needs-restarting ")
          if system("/bin/needs-restarting -r | grep \"Reboot is required\"")
                 reboot_required='YES'
          end
     else
       reboot_required='NO'
    end
  end
  setcode do
        reboot_required
      end
    end
end 

