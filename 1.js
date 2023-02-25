const fs = require('fs');

const programmers_dir = './programmers';
const leetcode_dir = './leetcode';
const hackerrank_dir = './leetcode';

const result = {
    programmers: [],
    leetcode: [],
    hackerrank: [],
};

const output_file = 'readme.md';

function check_condition(p) {
    if (
        './' + p.name === programmers_dir ||
        './' + p.name === leetcode_dir ||
        './' + p.name === hackerrank_dir
    ) {
        return false;
    }
    if (!p.isDirectory()) {
        return false;
    }
    if (p.name[0] == '.') {
        return false;
    }
    return true;
}

// programmers
fs.readdirSync(programmers_dir, { withFileTypes: true }).forEach((p) => {
    const name = p.name;
    const path = programmers_dir + '/' + name;

    if (!check_condition(p)) {
        return;
    }
    result['programmers'].push({
        name,
        length: fs.readdirSync(path).length,
    });
});

// write md file
if (!fs.existsSync(output_file)) {
    fs.openSync(output_file, 'w', 666);
}

fs.writeFileSync(output_file, '');

// 프로그래머스
let programmers_sum = 0;
fs.appendFileSync(
    output_file,
    '## Programmers\n|    Level    | solved |\n| :-------------: | :----: |\n',
    'utf-8'
);
result['programmers'].forEach((v) => {
    const { name, length } = v;
    temp = '|' + name + '|' + length + '|\n';
    programmers_sum += length;
    fs.appendFileSync(output_file, temp, 'utf-8');
});
fs.appendFileSync(
    output_file,
    '| **sum** | **' + programmers_sum + '**|\n\n',
    'utf-8'
);
console.log('programmers solved ' + programmers_sum + '!');

console.log('saved successfully! ' + output_file);
