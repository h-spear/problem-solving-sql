const fs = require('fs');

const home_dir = './';

const result = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 };
const except_list = ['1.js', 'README.md'];
const output_file = 'README.md';

function check_condition(name) {
    if (name[0] === '.') {
        return false;
    }
    if (except_list.includes(name)) {
        return false;
    }
    return true;
}

fs.readdirSync(home_dir, { withFileTypes: true }).forEach((p) => {
    const name = p.name;
    if (!check_condition(name)) {
        return;
    }
    const first_line = fs.readFileSync(name).toString().split('\n')[0];
    const level = first_line[8];
    result[level]++;
});

// write md file
if (!fs.existsSync(output_file)) {
    fs.openSync(output_file, 'w', 666);
}

fs.writeFileSync(output_file, '');
fs.appendFileSync(output_file, `## Programmers\n`, 'utf-8');
fs.appendFileSync(output_file, `|  level  | solved |\n`, 'utf-8');
fs.appendFileSync(output_file, `| :-----: | :----: |\n`, 'utf-8');
total_sum = 0;
for (let lv = 1; lv <= 5; lv++) {
    temp = '|' + lv + '|' + result[lv] + '|\n';
    total_sum += result[lv];
    fs.appendFileSync(output_file, temp, 'utf-8');
    console.log(`level${lv} solved ${result[lv]}`);
}
fs.appendFileSync(
    output_file,
    '| **sum** | **' + total_sum + '**|\n\n',
    'utf-8'
);
console.log(` total solved ${total_sum}!`);
