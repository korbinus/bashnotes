# Markdown Cheat Sheet

## Basic Syntax

### Headers

# Header 1
## Header 2
### Header 3
#### Header 4
##### Header 5
###### Header 6

### Emphasis
- *Italic* or _Italic_
- **Bold** or __Bold__
- ***Bold and Italic*** or ___Bold and Italic___

### Lists
#### Unordered
- Item 1
- Item 2
  - Subitem 2.1
  - Subitem 2.2

#### Ordered
1. First item
2. Second item
3. Third item
   1. Subitem 3.1
   2. Subitem 3.2

### Links
[Link text](http://example.com)

[Link with title](http://example.com "Title text")

### Images

![Alt text](image.jpg "Optional title")

## Extended Syntax

### Tables

| Syntax      | Description |
| ----------- | ----------- |
| Header      | Title       |
| Paragraph   | Text        |

| Left-aligned | Center-aligned | Right-aligned |
|:-------------|:---------------:|--------------:|
| Left         | Center          | Right         |


### Code
#### Inline

This is some beautiful `code`.


#### Blocks
```python
def hello_world():
    print("Hello, world!")
```

### Blockquotes
> This is a blockquote.
>
> This is the second paragraph in the blockquote.
>
> ## This is an H2 in a blockquote

### Horizontal Rule
---
or
***
or
___

### Footnotes
```
Here's a sentence with a footnote. [^1]

[^1]: This is the footnote.
```

## HTML

You can also use raw HTML in Markdown:
```html
<table>
  <tr>
    <th>Name</th>
    <th>Age</th>
  </tr>
  <tr>
    <td>John</td>
    <td>30</td>
  </tr>
</table>
```

## Task Lists

- [x] Task 1
- [ ] Task 2
- [ ] Task 3

## Definition Lists (GitHub Flavored Markdown)
term 1
: definition 1

term 2
: definition 2 with multiple lines

    and code blocks

## Strikethrough
~~strikethrough~~

## Syntax Highlighting (GitHub Flavored Markdown)

```javascript
function fancyAlert(arg) {
  if (1 < 2) {
    console.log('You win');
  }
}
```

## Escaping Characters
\*literal asterisks\*

## Math (GitHub Flavored Markdown)

$E = mc^2$
$$
\frac{d}{dx}\left( \int_{0}^{x} f(u) \, du\right) = f(x)
$$
