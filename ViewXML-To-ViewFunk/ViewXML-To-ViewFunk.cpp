#include <iostream>
#include <fstream>

int main()
{
	std::string line;
	std::cout << "Hello" << std::endl;

	std::ifstream ViewXML_File("View.xml");
	if( ViewXML_File.is_open() )
	{
		while( getline( ViewXML_File, line ) )
		{
			std::cout << line << std::endl;
		}
		ViewXML_File.close();
	}
	else
	{
		std::cout << "Unable to open the file.";
	}
}