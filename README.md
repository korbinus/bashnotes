# bashnotes

## Introduction

In today's digital age, many people turn to popular tools like Evernote, Notion, and others for managing their personal knowledge. While these tools offer convenience and a wide range of features, they often fall short in helping users build a true second brain. The main issues with these tools are:

1. **Lack of Structure**: They encourage dumping information without proper organization, leading to clutter and difficulty in retrieval.
2. **Passive Consumption**: Users tend to collect information without processing or internalizing it, resulting in knowledge that remains superficial.
3. **Overwhelm**: The sheer volume of features and possibilities can be paralyzing, making it hard to maintain a consistent practice.
4. **Remote Dependency**: These tools often rely on cloud services, creating dependency on external platforms with potential privacy concerns.

This system addresses these issues by implementing the **Domain-Note-Reflection-Summary (DNRS)** model, which promotes active engagement with information and structured knowledge building. 

Unlike cloud-based solutions, Bashnote operates only locally, giving you full control over your data while maintaining simplicity and effectiveness.

## Domain-Note-Reflection-Summary Model

The DNRS model is designed to help you process and internalize information effectively. Here's how it works:

1. **Domains**: Broad categories that represent areas of interest or expertise.
2. **Notes**: Individual pieces of information, ideas, or insights related to a specific domain.
3. **Reflections**: Deeper analysis or synthesis of notes within a domain.
4. **Summaries**: High-level overviews that capture the essence of a domain based on its notes and reflections.

This model ensures that you actively engage with your knowledge, transforming raw information into meaningful insights.


## Getting Started

Dowload Bashnotes from [Github](https://github.com/korbinus/bashnotes), either by downloading a zip file or by cloning the repository:

```bash
$ git clone https://github.com/korbinus/bashnotes.git
```

Move then to the directory bashnotes:
```bash
$ cd bashnotes
```


### Configuration

Before using the system, you can customize it by editing the `config.txt` file in your bashnote directory:

```ini
# Folder names configuration (change these to your preference)
notes_folder=1_notes
reflections_folder=2_reflections
summaries_folder=3_summaries

# Editor configuration (recommended: vscode or codium)
editor=vscode  # Options: vscode, codium, nano, vim, emacs...
```

### Creating a New Domain

To create a new domain:

```bash
$ new/domain.sh <Domain name>
```

This will automatically:
1. Create a new folder named after your domain (e.g., `Programming`, `Health`)
2. Set up the basic directory structure with subfolders for notes, reflections, and summaries
3. Create a `refs` directory for storing reference documents

The created directory structure will look like this:
```
<Domain name>/
├── 1_notes/          # Notes folder (customizable in config.txt)
├── 2_reflections/    # Reflections folder (customizable)
├── 3_summaries/      # Summaries folder (customizable)
└── refs/             # For storing reference documents
```

You can call for instance your first domain **General** until you find better others.

### Creating a New Note

To create a new note from the bashnote directory:

```bash
$ new/note.sh <Domain name> <Note title>
```

This will:
1. Create a new markdown file in the appropriate domain's notes folder
2. Open the file in your configured text editor (default: VS Code)

### Creating a New Reflection

To create a new reflection from the bashnote directory:

```bash
$ new/reflection.sh <Domain name> <Reflection title>
```

This will:
1. Create a new markdown file in the appropriate domain's reflections folder
2. Open the file in your configured text editor

### Creating a New Summary

To create a new summary from the bashnote directory:

```bash
$ new/summary.sh <Domain name> <Summary title>
```

This will:
1. Create or update a markdown file in the appropriate domain's summaries folder
2. Open the file in your configured text editor

## Managing Tags

### Adding Tags to Your Content

Tags help you organize and retrieve information more effectively:

1. After creating a note, reflection, or summary, open the generated markdown file
2. Add tags at the top of the file using this format:
   ```markdown
   tags: #tag1 #tag2 #tag3
   ```

### Creating Tag Indexes

To create an index of all your tags with links to corresponding notes:

```bash
$ new/tags.sh
```

This command will:
1. Scan all your domains for tagged content
2. Create a `tags` directory in your root folder if it doesn't exist
3. Generate a markdown file for each tag containing links to all notes that use that tag

The generated structure will look like this:
```
tags/
├── tag1.md       
├── tag2.md       
└── ...
```

Each tag file will contain:
- The tag name as a header
- A list of all notes using that tag with relative paths
- Links to each note for easy navigation

> **NOTE** You'll need to run it as often as necessary

## File Structure Example

Here's what your complete knowledge base might look like:

```
knowledge_base/
├── config.txt            # Configuration file
├── tags/                 # Auto-generated tag indexes
│   ├── programming.md
│   └── research.md
└── domains/
    ├── Programming/
    │   ├── 1_notes/
    │   │   ├── 2023-07-15_algorithm_concepts.md
    │   │   └── ...
    │   ├── 2_reflections/
    │   │   ├── 2023-08-01_code_review_thoughts.md
    │   │   └── ...
    │   ├── 3_summaries/
    │   │   └── programming_summary_2023.md
    │   └── refs/
    │       ├── design_patterns.pdf
    │       └── ...
    └── Health/
        ├── 1_notes/
        │   ├── 2023-07-20_nutrition_tips.md
        │   └── ...
        ├── 2_reflections/
        │   └── ...
        ├── 3_summaries/
        │   └── health_summary_2023.md
        └── refs/
            └── ...
```

### Backup
You can simply backup your data by copying the ```bashnotes```directory (or even only ```domains```) in a safe place. 

### Mobile availability

You can copy your files into you mobile device using for instance ```localsend``` if you absolutely need your bashnotes with you. 
Don't forget to install a markdown reader app on your mobile device!

## Conclusion

By adopting the DNRS model and following these guidelines, you'll transform how you manage and internalize knowledge. This system encourages active engagement, structured organization, and meaningful synthesis of information, helping you build a true second brain.

With this plain-text based approach:
- Your knowledge remains portable across systems
- You can easily search and manipulate your notes with standard tools
- The structure supports both quick note-taking and deep reflection

The system is designed to be simple yet powerful, giving you full control over your knowledge management process while providing helpful organization patterns.
