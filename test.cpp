#include <iostream>
#include <string>
#include <fstream>
#include <streambuf>

using namespace std;

string read_file(string filename)
{
    ifstream stream(filename);
    string source_string((std::istreambuf_iterator<char>(stream)),
                         std::istreambuf_iterator<char>());
    return source_string;
}

int main()
{

    string file_contents = read_file("test.sm");
    cout << file_contents << endl;

    return 0;
}
