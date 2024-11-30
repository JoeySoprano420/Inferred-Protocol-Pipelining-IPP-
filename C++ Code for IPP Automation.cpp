#include <iostream>
#include <map>
#include <vector>
#include <string>

using namespace std;

// Step 1: Define Node Webs and Registers
map<string, string> node_webs = {
    {"Terms", "AX"},
    {"Types", "BX"},
    {"Variables", "CX"},
    {"Values", "DX"},
    {"Tokens", "EX"}
};

// Step 2: Group Registers into Clusters
map<string, vector<string>> clusters = {
    {"Syntax Cluster", {"AX", "EX"}},
    {"Data Cluster", {"BX", "CX", "DX"}}
};

// Step 3: Group Clusters into Banks
map<string, vector<string>> banks = {
    {"Syntax Bank", clusters["Syntax Cluster"]},
    {"Data Bank", clusters["Data Cluster"]}
};

// Step 4: Automate Operations
void ipp_operation(string bank_name, string operation) {
    if (banks.find(bank_name) == banks.end()) {
        cerr << "Bank not found!" << endl;
        return;
    }
    cout << "Performing '" << operation << "' on " << bank_name << ": ";
    for (const auto& reg : banks[bank_name]) {
        cout << reg << " ";
    }
    cout << endl;
}

int main() {
    ipp_operation("Syntax Bank", "Call");
    ipp_operation("Data Bank", "Route");
    return 0;
}
