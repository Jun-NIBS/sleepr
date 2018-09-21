# Sleepr

[![Build Status](https://travis-ci.org/boupetch/sleepr.svg?branch=master)](https://travis-ci.org/boupetch/sleepr)

Sleep analysis with R.

## Installation

Sleepr latest version can be directly installed from Github using the `devtools` package.

```
devtools::install_github("boupetch/sleepr")
```

## Usage

### File manipulation

In Sleepr, `write_mdf()` and `read_mdf()` functions are used to write and read records on disk. Files are converted from the European Data Format (EDF) to Morpheo Data Format<sup>1</sup> (MDF). MDF is a simple, efficient and interoperable file format for biological timeseries. The format supports raw signal as long as metadata storage. 
MDF uses binary files for signals and JSON for metadata. Signals values are encoded by default in binary, 32 bits, little endian.

### Sleep visualization

![hypnogram](man/hypnogram.jpeg)

### Statistics computing

Various statistics can be computed from the polysomnographic data, signals and events. Durations are expressed in *minutes*, indexes in *hours*.

#### Stages & scoring

These functions compute statistics based on stage scoring.

  * `rem_duration`: Total duration of REM sleep in minutes.
  * `n1_duration`: Total duration of N1 sleep in minutes.
  * `n2_duration`: Total duration of N2 sleep in minutes.
  * `n3_duration`: Total duration of N3 sleep in minutes.
  * `awa_duration`: Total duration of wake in minutes.
  * `tts`: Time To Sleep (N1+N2+N3+REM durations) in minutes.
  * `rem_tts`: REM over TTS duration ratio.
  * `n3_tts`: N3 over TTS duration ratio.
  * `n2_tts`: N2 over TTS duration ratio.
  * `n1_tts`: N1 over TTS duration ratio.
  * `tsp`: Total Sleep Period.
  * `sleep_efficiency`: Sleep Efficiency.
  * `sleep_latency`: Sleep Latency.
  * `rem_latency`: REM Sleep Latency.
  * `waso`: Wake After Sleep Onset.
  
#### Position & activity

  * `tts_pos_back`: TTS duration in back position in minutes.
  * `tts_pos_back_pct`: TTS duration in back position over TTS duration.
  * `tts_pos_left`: TTS duration in left position in minutes.
  * `tts_pos_left_pct`: TTS duration in left position over TTS duration.
  * `tts_pos_right`: TTS duration in right position in minutes.
  * `tts_pos_right_pct`: TTS duration in right position over TTS duration.
  * `tts_pos_stomach`: TTS duration in left position in minutes.
  * `tts_pos_stomach_pct`: TTS duration in stomach position over TTS duration.
  * `tts_pos_nonback`: TTS duration in non-back position in minutes.
  * `tts_pos_nonback_pct`: TTS duration in non-back position over TTS duration.
  
#### Snoring

  * `snoring_count`
  * `snoring_index`
  * `snoring_duration`
  * `snoring_duration_pct`
  
## Package Testing

Testing use [testthat](https://github.com/r-lib/testthat).

### Generating Sleepr package reference manual

```
R CMD Rd2pdf . && mv ..pdf sleepr.pdf && rm -r .Rd2pdf*
```

## References

1. P. Bouchequet, D. Jin, G. Solelhac, M. Chennaoui, D. Leger, [«*Morpheo Data Format (MDF), un nouveau format de données simple, robuste et performant pour stocker et analyser les enregistrements de sommeil*»](https://www.sciencedirect.com/science/article/pii/S1769449318301304), Médecine du Sommeil, vol. 15, n 1, p. 48‑49, march 2018.
