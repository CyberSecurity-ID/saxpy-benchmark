
# Results

This is autogenerated page from the results recorded in CSV and [result_specs.json](result_specs.json)
file. To submit a result:
1. Record your test results in a CSV file. Repeat a test by at least 5 times. See other csv files for samples.
2. Create an entry in result_specs.json
3. Create pull request

# MacBook Pro 13" late 2013, on board Intel Iris GPU

(tested by Benny Prijono on 2017-11-14)


### Specs

| System | MacBook Pro 13" late 2013 |
| OS | OS X 10.11.14 |
| GPU | on board Intel Iris |
| OpenCL | preinstalled (XCode 5.1.1) |


### Result

![benny-macbook.png](benny-macbook.png?raw=true "benny-macbook.png")


 ### Details

| Test   | Mean Time (ms) | StdDev (ms) |
|--------| --------: | --------: |
| Python loop | 20491.674 | 2353.082 |
| Numpy | 448.097 | 14.627 |
| OpenCL GPU | 56.174 | 1.138 |
| C++ | 50.127 | 2.145 |
| OpenCL CPU | 47.663 | 0.936 |


### Notes

- outlier "Python loop" is removed from the chart



# i7-6700 3.40GHz, NVidia GTX 475

(tested by Benny Prijono on 2017-11-14)


### Specs

| System | HP Pavilion 550-227 desktop |
|  | Intel i7-6700 CPU @ 3.40GHz (4 cores, HT capable) |
| OS | Windows 10 64bit |
| GPU | NVidia GeForce GTX 475 4GB mem |
| Compiler | Visual Studio 2015 C++ compiler 64bit version |
| CUDA | Version 8.0.61 |
| OpenCL | - Intel OpenCL SDK Version 7.0.0.2519 |
|  | - OpenCL from CUDA SDK |
| Python | 2.7.12 64bit |
| PyOpenCL | version 2017.2 (prebuilt binary) |


### Result

![benny-desktop1.png](benny-desktop1.png?raw=true "benny-desktop1.png")


 ### Details

| Test   | Mean Time (ms) | StdDev (ms) |
|--------| --------: | --------: |
| Python loop | 12494.000 | 198.252 |
| Numpy | 289.167 | 21.628 |
| PyOpenCL GPU | 222.500 | 3.271 |
| OpenCL CPU | 110.983 | 2.128 |
| PyOpenCL CPU | 46.000 | 1.265 |
| C++ | 42.213 | 3.059 |
| CUDA | 32.218 | 0.019 |
| OpenCL GPU | 31.970 | 0.057 |


### Notes

- outlier "Python loop" is removed from the chart

