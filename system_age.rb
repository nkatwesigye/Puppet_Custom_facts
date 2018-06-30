#Author : nkatwesigye@gmail.com
# expose how old a system is since the first time it was installed 
# written to allow automated operations jobs based on system age
# 01-22-18

require "date"

if Facter.value(:osfamily) != 'windows'

Facter.add('system_age') do

if Facter.value(:os)['name'] == 'Ubuntu'
    
       str= %x[ls -alct  --time-style=full-iso /|tail -1|awk '{print $6, $7}' | cut -d : -f 1,2,3]
else

    str = %x[rpm -qi  basesystem | grep "Install Date" | cut -d : -f2,3,4]

end

date_obj=  DateTime.parse str

installtime_value= date_obj.to_time.to_i

current_time = DateTime.now.to_time.to_i

elapsed_time = current_time - installtime_value

hours_old = (elapsed_time) /(60*60)

if hours_old.is_a?Numeric

   hours_old

else

  hours_old='not_set'

end

  setcode do


    hours_old

  end
   end
end
