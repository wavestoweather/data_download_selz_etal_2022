## Readme
This text explains how to retrieve and use the data of

Selz, T., M. Riemer, and G. Craig, 2022: The transition from practical to intrinsic predictability of midlatitude weather. Journal of the Atmospheric Sciences. https://www.doi.org/10.1175/JAS-D-21-0271.1

### Download of the data
A bash script `data_download.sh` is provided in this repository for download. To download the entire dataset (132 tar-files, 4.4TB in total) copy the script into your target folder and execute it there. To download only a subset of the dataset you can modify the variables `exps` and `cases` in the download script accordingly. After download use

    tar xvf <filename.tar>
    
to unpack the data. To unpack everything you can use

    find . -name "*.tar" -exec tar xvf {} \;

### Data description
The paper considers 9 different experiments, 
- 1.0000:    stochastic convection with 100% ICU, R2B6
- 1.0000_SV: stochastic convection with 100% ICU+singular vectors, R2B6
- 0.5000:    stochastic convection with  50% ICU, R2B6
- 0.2000:    stochastic convection with  20% ICU, R2B6
- 0.1000:    stochastic convection with  10% ICU, R2B6
- 0.0010:    stochastic convection with 0.1% ICU, R2B6
- 1.0000_Ti: deterministic convection with 100% ICU, R2B6
- 0.1000_Ti: deterministic convection with  10% ICU, R2B6
- 0.0010_Ti: deterministic convection with 0.1% ICU, R2B6,

plus two that are repeated at a higher resolution,
- 1.0000:    stochastic convection with 100% ICU, R2B7
- 0.0010:    stochastic convection with 0.1% ICU, R2B7.

`ICU` Initial condition uncertainty derived from ECMWF's EDA system  
`R2B6` approx. 40km model resolution  
`R2B7` approx. 20km model resolution 

Every experiment consists of 12 cases (initialization times) and 5 members, giving 660 individual simulations in total. The data of each simulation is stored in a separate folder which is named:

    output_<exp>_<case>_<resolution>_<member>  
        
`<exp>`   the experiment from the list above  
`<case>` the case, i.e. the initial time (20161001, 20161101, ..., 20170901)  
`<resolution>` R2B6 or R2B7  
`<member>` 5 randomly selected members from 1-50

The directories of the 5 members are packed into one tar-file, resulting in 132 tar-files in total.

After unpacking, in each folder the relevant simulation output is stored in multiple files, with `<ifile>` being a 4-digit consecutive number:

`NWP_ERR_lonlat_PL_<ifile>.nc` contains 300hPa horizontal wind and geopotential for the kinetic energy-based error metrics  
`NWP_UA_lonlat_ML_<ifile>.nc` contains the upper-air variables u, v, pv, temp, pres on model levels  
`NWP_TEND_lonlat_ML_<ifile>.nc` contains the accumulated increments from the parameterization schemes since forecast start on model levels

All output has been interpolated to a regular 1?? lat-lon grid (independent of the model resolution) and has hourly temporal resolution.

The output is stored in the `NETCDF4`-format and has been compressed using the `HDF5-BLOSC` lossless compression algorithm for the first forecast day and the `H5Z-ZFP` lossy compression algorithm afterwards. To read the data, the corresponding `HDF5`-plugins are required. They are open-source and publicly available on github:
- https://github.com/Blosc/hdf5-blosc
- https://github.com/LLNL/H5Z-ZFP

Alternatively, the data can be read with the python-package `enstools`, which includes the necessary HDF5-plugins. This is also open-source and available at:
- https://github.com/wavestoweather/enstools

In case of problems or questions please contact forschungsdaten@uni-mainz.de or tobias.selz@lmu.de.
