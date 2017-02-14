module N2W
class Tel
  
  def self.sortln(x)
ab=x.to_s 
ap=ab.scan(/[^\d]/).count
if ab.scan(/(\d\d\d).{0,2}\1|(\d)\2\2|(\d)\3/).count>1
    smarti ab
else    
    tel_number ab
end
end 

def self.smarti d
da=d.to_s.split ""
da.map! { |x| 
if x=="0"||x=="1"||x=="2"||x=="3"||x=="4"||x=="5"||x=="6"||x=="7"||x=="8"||x=="9"
    x
else
    ","
end}
daa=da.join("").split(","); daa.delete("");
d=daa.join
a=d.enum_for(:scan, /(\d\d\d).{0,2}\1|(\d)\2\2|(\d)\3/).map { Regexp.last_match.begin(0) }
b=d.enum_for(:scan, /(\d\d\d).{0,2}\1|(\d)\2\2|(\d)\3/).map { Regexp.last_match.end(0)-1 }
e=[]
da.delete(",")
z=a.length
for i in 0..(z-1)
 pp = da[a[i]..b[i]].join
e << pp
 end
e.map! {|x| tel_number x}
d.gsub!(/(\d\d\d).{0,2}\1|(\d)\2\2|(\d)\3/,"-")
d1=d.split("-").map! {|x|  tel_number x }
d1.delete ""
d.gsub!(/\b\d*\b/," ").gsub!("  "," ")
pr, de = 0, 0
ery=d.split("").map!{|x| if x==" "
pr+=1
x=d1[(pr-1)]
elsif x=="-"
de+=1
x=e[de-1]
end}
ery.join ", "
end

def self.tel_number(x, s=" - ")
ab=x.to_s.split("") 
ae=""
ab.map! do |x| 
if x=="0"||x=="1"||x=="2"||x=="3"||x=="4"||x=="5"||x=="6"||x=="7"||x=="8"||x=="9"
    x
#elsif x=="+"
#   ae="your local international dial code plus, "
else
    ","
end
end
az=ab.join("").split(","); az.delete("");
az.map! do |x|
    if x.length>3 
	       if x.length%2==0
	       x.split("").each_slice(2).to_a.map! {|x| number(x.join) }.join(", ") 
	       else
	       x.split("").reverse.each_slice(3).to_a.map! {|x| x.reverse}.reverse.map! {|x| number(x.join)}.join(", ")
	       end
	else 
	    number(x)
	end
  end
az.join(", ")
end

def self.number(x, s=" ")
a=x.to_s.split("")
a.map! { |x| x.to_i }
    one={0=>"zero",1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine"}
two_r={1=>"ten",2=>"twenty",3=>"thirty",4=>"forty",5=>"fifty",6=>"sixty",7=>"seventy",8=>"eighty",9=>"ninety"}
two_i={1=>"eleven", 2=>"twelve", 3=>"thirteen", 4=>"fourteen", 5=>"fifteen", 6=>"sixteen", 7=>"seventeen", 8=>"eighteen", 9=>"nineteen"}
tnm=Proc.new do	
            if a[-2]==a[-1] && a[-2]!=1
                    "double "+one[a[-2]]
            else
        			if a[-2]==0	|| a[-1]==0		
        					one[a[-2]]+s+one[a[-1]]
        			elsif a[-2]==1 && (a[-1]==1 || a[-1]==2)
        					two_i[a[-1]]
        			elsif a[-2]==1 && (a[-1]!=1 || a[-1]!=2)
        			        one[a[-2]]+s+one[a[-1]]
        			elsif a[-2]==7
        			        one[a[-2]]+s+one[a[-1]]
        			else
        				    two_r[a[-2]]+s+one[a[-1]]
        		    end 
            end
        end
tnn=Proc.new do	
            if a[-2]==a[-1] 
                    "double "+one[a[-2]]
            else
        			if a[-2]==0 || a[-1]==0
        					one[a[-2]]+s+one[a[-1]]       	
        			elsif a[-2]==1 && (a[-1]==1 || a[-1]==2)
        					two_i[a[-1]]
        			elsif a[-2]==1 && (a[-1]!=1 || a[-1]!=2)
        			        one[a[-2]]+s+one[a[-1]]
        			elsif a[-2]==7
        			        one[a[-2]]+s+one[a[-1]]
        			else
        				    two_r[a[-2]]+s+one[a[-1]]
        		    end 
            end
        end
    if x.length==1
        return one[a[0]]
    elsif x.length==2 
    	    return tnm.call
	elsif x.length==3	 
		   if a[1]==a[2] && a[2]==a[0]
	          return "triple"+s+one[a[0]]
	       elsif a[0]==a[1] && a[1]!=a[2]
	          return "double"+s+one[a[1]]+s+one[a[2]]
	       elsif a[0]!=0 && a[1]==0 && a[2]==0 
	          return (one[a[0]]+s+"hundred")
	       elsif a[1]==3 || a[1]==9 || a[1]==6 || a[1]==8 
	          return one[a[0]]+s+tnn.call
	       else
	          return one[a[0]]+s+one[a[1]]+s+one[a[2]]
	       end	   
    end
end
  
end
end