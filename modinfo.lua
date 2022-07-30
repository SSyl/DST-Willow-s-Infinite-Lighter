name = "Infinite Lighter"
version = "1.20"
author = "Syl"

description = "Make Willow's lighter have infinite durability/use. It does this by removing the fuel component entirely from the lighter, meaning it doesn't show a % of use at all."..
"\n\nYou can also specify if you want to allow characters other than Willow to use the lighter or to cook with the lighter."

-- I haven't uploaded it to Klei forums
forumthread = ""

configuration_options =
{
  {
    name = "removeFuelOption",
    label = "Disable Lighter Fuel",
    hover = "Make Willow's lighter have infinite fuel."..
    "\nDefault: Yes",
    options =
       {
         {description = "Yes", data = true},
         {description = "No", data = false},
       },
    default = true
  },
	{
		name = "onlyWillowOption",
		label = "Only Willow",
    hover = "Characters other than Willow drop the lighter."..
    "\nDefault: Yes",
		options =
			 {
				 {description = "Yes", data = true},
				 {description = "No", data = false},
			 },
    default = true
	},
	{
		name = "allowCookingOption",
		label = "Allow Lighter Cooking",
    hover = "Characters other than Willow can cook with the lighter."..
    "\nDefault: No",
		options =
			 {
				 {description = "Yes", data = true},
				 {description = "No", data = false},
			 },
    default = false
  },
}

api_version_dst = 10

priority = -999

-- Willow has an infinite lighter in single player, so it's only for DST
dont_starve_compatible = false
reign_of_giants_compatible = false
dst_compatible = true

all_clients_require_mod = false
client_only_mod = false

server_filter_tags = {"infinite lighter"}

icon_atlas = "InfiniteLighterIcon.xml"
icon = "InfiniteLighterIcon.tex"
