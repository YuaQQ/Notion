# Commonly seen datatypes

# 🧬 Bioinformatics File Formats — Student Reference Guide

> Each file format is designed for a specific type of biological data. Knowing which format to use — and why — is a core skill in bioinformatics.
> 

---

## 🧬Sequence Data

### `.fasta` — Fast-All (FASTA)

- Stores nucleotide (DNA/RNA) or protein sequences in plain text
- Each entry has a header line starting with `>` followed by the sequence on the next line(s)
- Example use: storing a genome, gene, or protein for BLAST searches
- Simple format — no quality scores, just the raw sequence

### `.fastq` — FASTQ

- Extension of FASTA that also stores **quality scores** for each nucleotide
- Each entry has 4 lines: identifier, sequence, separator (`+`), and quality scores (encoded as ASCII characters)
- Produced directly by next-generation sequencers (e.g., Illumina)
- Quality scores indicate how confident the sequencer was about each base call (higher = more reliable)

### `.sra` — Sequence Read Archive

- A compressed binary format used by NCBI's Sequence Read Archive database
- Stores raw sequencing reads (can be converted to FASTQ for analysis)
- Downloading `.sra` files is how researchers access publicly published sequencing data
- Requires the **SRA Toolkit** to extract reads into usable formats like FASTQ

---

## 📌Alignment & Mapping Data

### `.sam` — Sequence Alignment/Map

- Human-readable text format storing how sequencing reads align to a reference genome
- Each row represents one read and includes position, orientation, mapping quality, and mismatches
- Header lines (starting with `@`) contain metadata about the reference and alignment tool used
- Used as a starting point for many downstream analyses (variant calling, RNA-seq quantification)

### `.bam` — Binary Alignment/Map

- The compressed binary version of SAM — same information, but ~4–5× smaller and faster to process
- Cannot be read directly by humans; requires tools like **SAMtools** to view or manipulate
- Almost always used instead of SAM in practice due to storage and speed advantages
- BAM files are typically sorted and indexed (creating a `.bai` index file) for rapid data retrieval

---

## 🗺️ Genome Annotation & Region Data

### `.bed` — Browser Extensible Data

- Tab-delimited text file describing genomic regions: chromosome, start position, end position
- Optional extra columns can store names, scores, strand (`+`/`–`), and display colors
- Commonly used to mark gene locations, regulatory elements, peaks from ChIP-seq, etc.
- ⚠️ Coordinates are **0-based** (counting starts at 0), unlike most other formats — a common source of confusion!

### `.bigwig` — BigWig

- Binary indexed format that stores continuous numerical values across a genome (a "signal track")
- Typically used to visualize read coverage, GC content, or ChIP-seq/ATAC-seq signal in genome browsers
- Much more efficient than text-based alternatives for large datasets
- Commonly viewed in tools like **UCSC Genome Browser** or **IGV**

### `.vcf` — Variant Call Format

- Stores information about genetic variants: SNPs (single nucleotide polymorphisms), insertions, and deletions
- Each row describes one variant: chromosome, position, reference allele, alternate allele, and quality info
- Header lines (starting with `##`) define all the metadata and field meanings
- Central to genomics studies like **GWAS** (genome-wide association studies) and clinical diagnostics

---

## 🔬 Protein & Structural Data

### `.pdb` — Protein Data Bank

- Stores 3D atomic coordinates of proteins, nucleic acids, and other biomolecules
- Each `ATOM` or `HETATM` record specifies an atom's element, position (x, y, z), and the residue it belongs to
- PDB files are deposited in the **RCSB Protein Data Bank** — a global open repository of 3D structures
- Used in structural biology, drug design, and understanding how proteins function

---

## 📊 Tabular & General Data

### `.csv` — Comma-Separated Values

- General-purpose plain text table where values in each row are separated by commas
- First row is typically a header row with column names
- Used everywhere in bioinformatics: storing metadata, sample sheets, gene expression counts, etc.
- Easily opened in Excel, R, Python (pandas), or any text editor

### `.tabular` — Tabular / TSV (Tab-Separated Values)

- Like CSV but uses a **tab character** as the delimiter instead of a comma
- Preferred in many bioinformatics tools because gene names and annotations often contain commas
- Common output format from tools like BLAST, DESeq2, and Galaxy
- File extensions may be `.tsv`, `.txt`, or simply `tabular` depending on the tool

---

## 📋 Quick Reference Summary

| Format | Full Name | Category | Key Use |
| --- | --- | --- | --- |
| `.fasta` | Fast-All | Sequence | Store DNA/protein sequences |
| `.fastq` | FASTQ | Seq + Quality | Raw sequencer output with quality scores |
| `.sra` | Sequence Read Archive | Raw Reads | Download public sequencing data |
| `.sam` | Sequence Alignment/Map | Alignment | Reads mapped to genome (text) |
| `.bam` | Binary Alignment/Map | Alignment | Compressed SAM (faster/smaller) |
| `.bed` | Browser Extensible Data | Genomic Regions | Define genomic intervals |
| `.bigwig` | BigWig | Signal Track | Genome-wide coverage signal |
| `.vcf` | Variant Call Format | Variants | SNPs, insertions, deletions |
| `.pdb` | Protein Data Bank | 3D Structure | Atomic coordinates of biomolecules |
| `.csv` | Comma-Separated Values | Tabular | General data tables |
| `.tabular` | Tabular / TSV | Tabular | Tab-delimited data tables |

---

> 💡 **Tip:** Text formats (`.fasta`, `.sam`, `.vcf`, `.csv`) can be opened in any text editor. Binary formats (`.bam`, `.bigwig`, `.sra`) require special software tools.
>