const fs = require('fs');

const leetcode_dir = './leetcode';
const programmers_dir = './programmers';
const hackerrank_dir = './hacker-rank';

const result = {
    leetcode: [],
    programmers: [],
    hackerrank: [],
};

const except_list = ['certificate'];

console.log('certificate' in except_list);
const output_file = 'readme.md';

function check_condition(p) {
    if (
        './' + p.name === leetcode_dir ||
        './' + p.name === programmers_dir ||
        './' + p.name === hackerrank_dir
    ) {
        return false;
    }
    if (except_list.includes(p.name)) {
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

// leetcode
fs.readdirSync(leetcode_dir, { withFileTypes: true }).forEach((p) => {
    const name = p.name;
    const path = leetcode_dir + '/' + name;

    if (!check_condition(p)) {
        return;
    }
    result['leetcode'].push({
        name,
        length: fs.readdirSync(path).length,
    });
});

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

// hackerrank
fs.readdirSync(hackerrank_dir, { withFileTypes: true }).forEach((p) => {
    const name = p.name;
    const path = hackerrank_dir + '/' + name;

    if (!check_condition(p)) {
        return;
    }
    result['hackerrank'].push({
        name,
        length: fs.readdirSync(path).length,
    });
});

// write md file
if (!fs.existsSync(output_file)) {
    fs.openSync(output_file, 'w', 666);
}

fs.writeFileSync(output_file, '');

// 리트코드
let leetcode_sum = 0;
fs.appendFileSync(
    output_file,
    '## Leetcode\n|    Difficulty    | solved |\n| :-------------: | :----: |\n',
    'utf-8'
);
result['leetcode'].forEach((v) => {
    const { name, length } = v;
    temp = '|' + name + '|' + length + '|\n';
    leetcode_sum += length;
    fs.appendFileSync(output_file, temp, 'utf-8');
});
fs.appendFileSync(
    output_file,
    '| **sum** | **' + leetcode_sum + '**|\n\n',
    'utf-8'
);
console.log('leetcode solved ' + leetcode_sum + '!');

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

// 해커랭크
let hackerrank_sum = 0;
fs.appendFileSync(
    output_file,
    '## HackerRank\n|    subdomain    | solved |\n| :-------------: | :----: |\n',
    'utf-8'
);
result['hackerrank'].forEach((v) => {
    const { name, length } = v;
    temp = '|' + name + '|' + length + '|\n';
    hackerrank_sum += length;
    fs.appendFileSync(output_file, temp, 'utf-8');
});
fs.appendFileSync(
    output_file,
    '| **sum** | **' + hackerrank_sum + '**|\n\n',
    'utf-8'
);
console.log('hacker rank solved ' + hackerrank_sum + '!');

console.log('saved successfully! ' + output_file);
