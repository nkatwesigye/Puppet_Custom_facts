#Author : nkatwesigye@gmail.com
# Check dns service status on all puppet environment , report as a fact with success or failure 
results= "nil"
results2= "nil"
testdomain = ""
test_dns_server = " "

if Facter.value(:osfamily) != 'windows'
Facter.add('dns_state') do
begin
  Timeout::timeout(5) {
      dns_obj = Resolv::DNS.new(:nameserver => [$test_dns_server],:search => ${testdomain},:ndot => 1)
      results = dns_obj.getresources("www.google.com",Resolv::DNS::Resource::IN::A)
      results2 = dns_obj.getresources("apt.ubuntu.com",Resolv::DNS::Resource::IN::A)
                    }
rescue Timeout::Error => e
    dns_state='dns_failed'

setcode do

     dns_state

        end

else

    dns_state='dns_passed'

      end

    setcode do

        dns_state

          end

             end
end


