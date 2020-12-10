CC=/root/.arduino15/packages/adafruit/tools/arm-none-eabi-gcc/9-2019q4/bin/arm-none-eabi-gcc
CXX=/root/.arduino15/packages/adafruit/tools/arm-none-eabi-gcc/9-2019q4/bin/arm-none-eabi-g++
CXXFLAGS= -mcpu=cortex-m4 -mthumb -c -g -Os -w -std=gnu++11 -ffunction-sections -fdata-sections -fno-threadsafe-statics -nostdlib --param max-inline-insns-single=500 -fno-rtti -fno-exceptions "-D__SKETCH_NAME__=\"\"\"build.ino\"\"\"" -w -x c++ -E -CC -DF_CPU=120000000L -DARDUINO=10607 -DARDUINO_METRO_M4 -DARDUINO_ARCH_SAMD -D__SAMD51J19A__ -DADAFRUIT_METRO_M4_EXPRESS -D__SAMD51__ -DUSB_VID=0x239A -DUSB_PID=0x8020 -DUSBCON -DUSB_CONFIG_POWER=100 "-DUSB_MANUFACTURER=\"Adafruit LLC\"" "-DUSB_PRODUCT=\"Adafruit Metro M4\"" -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/cores/arduino/TinyUSB -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/cores/arduino/TinyUSB/Adafruit_TinyUSB_ArduinoCore -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/cores/arduino/TinyUSB/Adafruit_TinyUSB_ArduinoCore/tinyusb/src -D__FPU_PRESENT -DARM_MATH_CM4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DENABLE_CACHE -Os -DVARIANT_QSPI_BAUD_DEFAULT=50000000 -D__SAMD51J19A__ -DADAFRUIT_METRO_M4_EXPRESS -D__SAMD51__ -DUSB_VID=0x239A -DUSB_PID=0x8020 -DUSBCON -DUSB_CONFIG_POWER=100 "-DUSB_MANUFACTURER=\"Adafruit LLC\"" "-DUSB_PRODUCT=\"Adafruit Metro M4\"" -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/cores/arduino/TinyUSB -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/cores/arduino/TinyUSB/Adafruit_TinyUSB_ArduinoCore -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/cores/arduino/TinyUSB/Adafruit_TinyUSB_ArduinoCore/tinyusb/src -D__FPU_PRESENT -DARM_MATH_CM4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 -I/root/.arduino15/packages/adafruit/tools/CMSIS/5.4.0/CMSIS/Core/Include/ -I/root/.arduino15/packages/adafruit/tools/CMSIS/5.4.0/CMSIS/DSP/Include/ -I/root/.arduino15/packages/arduino/tools/CMSIS-Atmel/1.2.0/CMSIS/Device/ATMEL/ -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/cores/arduino -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/variants/metro_m4 -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/libraries/Wire -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/libraries/SPI -I/root/.arduino15/packages/adafruit/hardware/samd/1.6.4/libraries/Adafruit_ZeroDMA -I/root/Arduino/libraries/Adafruit_SPIFlash/src -I/root/Arduino/libraries/SdFat_-_Adafruit_Fork/src

CFLAGS=$(CXXFLAGS)

#OBJ =
ODIR=$(PWD)

_OBJ = Adafruit_GFX.o Adafruit_SPITFT.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: %.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)
	
foomake: $(OBJ)
	#$(CXX) $(CXXFLAGS) -o $(ODIR)/Adafruit_GFX.o $(ODIR)/Adafruit_SPITFT.o
	$(CXX) -o $@ $^ $(CXXFLAGS) $(LIBS)
	
ccmake: glcdfont.o utf8_decode.o
	$(CC) $(CFLAGS) -o glcdfont.o utf8_decode.o
	
	
.PHONY:  clean all

all: foomake ccmake

clean:
	rm -f $(ODIR)/*.o *~ core *.o
	