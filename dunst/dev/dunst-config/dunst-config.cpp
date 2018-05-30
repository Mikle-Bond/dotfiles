#include <array>
#include <cstdio>
#include <iostream>
#include <string>
#include <regex>

using std::cout;
using std::cin;
using std::string;

string xrdb_call(const string & param);

int main(void)
{
	const std::regex re("(.*)\\$\\{xrdb:(.*)\\}(.*)");

	for (string line; std::getline(cin, line); ) {
		std::smatch m;
		if (!std::regex_match(line, m, re) || m.size() < 3) {
			cout << line << '\n';
			continue;
		}

		cout << m[1] << xrdb_call(m[2]) << m[3] << '\n';
	}

	cout << std::endl;

	return 0;
}

string xrdb_call(const string & param) 
{
	std::array<char, 64> buf;

	string cmd = "xgetres Dunst." + param;
	string result;

	std::shared_ptr<FILE> p(popen(cmd.c_str(), "r"), pclose);
	if (!p) 
		throw std::runtime_error("popen() failed!");

	while (!std::feof(p.get())) {
		if (NULL == std::fgets(buf.data(), 64, p.get())) 
			break;
		result += buf.data();
	}

	result.pop_back();

	return result;
}

