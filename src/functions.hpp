#include <string>
#include <deque>

#pragma once

bool is_slash(const std::string& str);
std::string get_path(const std::string& current, const std::string& target);
std::string absolute_path(const std::string& path);
std::string without_end_after_slash(const std::string& str);
bool is_good_name(const std::string& str);
bool compare_with_end(const std::string& str, const std::string& end);
std::string to_shell(const std::string& str);
void remove_r(const char* path);
std::string myto_string(long long int a);
std::deque<int> kmp(const std::string& text, const std::string& pattern);
std::string GetFileContents(const std::string& file_name);
void eraseHTTPprefix(std::string& str);
std::string convert_from_HTML(const std::string& str);
bool is_number(const std::string&);
int to_int(const std::string&);

inline bool file_exist(const std::string& name)
{return !system(("stat "+to_shell(name)+" 2> /dev/null > /dev/null").c_str());}