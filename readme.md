# ECV optimized microdata files

This repository provides the whole collection of microdata files from Spain´s "Encuesta de Condiciones de Vida" for all the waves published by INE until 2026 (2004-2024).

## 1. Optimization

Instead of individual "household" and "personal" files, after merging we obtain a single microdata file for each wave compressed to gz format (optimized for data.table library).

---

## 2. Project structure

### "data" dir

It contains the original microdata files obtained from the original provided by [INE](https://www.ine.es/dyngs/INEbase/es/operacion.htm?c=Estadistica_C&cid=1254736176807&menu=resultados&idp=1254735976608).

There are three main files for each wave: **h (households)**, **p (personal)** and **d (basic households data)**

### "out" dir

The out folder on the root of this project contains optimized microdata files merging main households/persona files. There is a gz file corresponding to each individual set of wave files (h,d,p).

### "src" dir (Example files)

The source dir (src) contains 4 main files which:

- **optimize.R**: performs optimization from microdata files (data) to optimized single files (src)
- **test.R**: a testing interface to integrate the whole sequence of microdata files and survey robust estimation of population statistics.
- **ccaa.R**: a test file handling CCAA level data (the code has been recylced from the one used for GECU´s report available at: https://estudioscriticosurbanos.com/wp-content/uploads/2024/04/El-mercado-de-alquiler-fuente-de-desigualdad-social-2.pdf
- **IPC_alquiler.R**: A robust implementation of optimized files and survey library to estimate the evolution of the cost of hosuing for households renting their primary resindence.


### "doc" dir

Contains the latest documentation and statistical design characteristics of ECV (2024 wave).

---

## 📄 License

This project is licensed under the GNU General Public License v3.0 (GPLv3). Additionally, the content and associated documentation are distributed under a Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) license.

2025-10-21 @maiktreya

**Contact:** <garciaduchm@gmail.com>