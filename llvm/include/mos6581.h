/// @file
/// The MOS 6581/8580 SID (Sound Interface Device)
///
/// MOS 6567 / 6569 Video Interface Chip (VIC II)
/// http://archive.6502.org/datasheets/mos_6581_sid.pdf

/// The MOS 6581/8580 SID (Sound Interface Device)
struct MOS6581_SID {
    /// Channel 1 Frequency
    unsigned int CH1_FREQ;
    /// Channel 1 Pulse Width (0-4095)
    unsigned int CH1_PULSE_WIDTH;
    /// Channel 1 Control
    char CH1_CONTROL;
    /// Channel 1 Attack/decay
    char CH1_ATTACK_DECAY;
    /// Channel 1 Sustain/Release
    char CH1_SUSTAIN_RELEASE;
    /// Channel 2 Frequency
    unsigned int CH2_FREQ;
    /// Channel 2 Pulse Width (0-4095)
    unsigned int CH2_PULSE_WIDTH;
    /// Channel 2 Control
    char CH2_CONTROL;
    /// Channel 2 Attack/decay
    char CH2_ATTACK_DECAY;
    /// Channel 2 Sustain/Release
    char CH2_SUSTAIN_RELEASE;
    /// Channel 3 Frequency
    unsigned int CH3_FREQ;
    /// Channel 3 Pulse Width (0-4095)
    unsigned int CH3_PULSE_WIDTH;
    /// Channel 3 Control
    char CH3_CONTROL;
    /// Channel 3 Attack/decay
    char CH3_ATTACK_DECAY;
    /// Channel 3 Sustain/Release
    char CH3_SUSTAIN_RELEASE;
    /// Filter Cutoff Low
    char FILTER_CUTOFF_LOW;
    /// Filter Cutoff High
    char FILTER_CUTOFF_HIGH;
    /// Resonance and Filter Setup
    char FILTER_SETUP;
    /// Resonance and Filter Setup
    char VOLUME_FILTER_MODE;
    /// Potentiometer X
    char POT_X;
    /// Potentiometer Y
    char POT_Y;
    /// Channel 3 Oscillator Value
    char CH3_OSC;
    /// Channel 3 Envelope Value
    char CH3_ENV;
};

/// Channel 1 Frequency Low byte
char * const SID_CH1_FREQ_LO = (char*)0xd400;
/// Channel 1 Frequency High byte
char * const SID_CH1_FREQ_HI = (char*)0xd401;
/// Channel 1 Pulse Width (0-4095) Low byte
char * const SID_CH1_PULSE_WIDTH_LO = (char*)0xd402;
/// Channel 1 Pulse Width (0-4095) High byte
char * const SID_CH1_PULSE_WIDTH_HI = (char*)0xd403;
/// Channel 2 Frequency Low byte
char * const SID_CH2_FREQ_LO = (char*)0xd407;
/// Channel 2 Frequency High byte
char * const SID_CH2_FREQ_HI = (char*)0xd408;
/// Channel 2 Pulse Width (0-4095) Low byte
char * const SID_CH2_PULSE_WIDTH_LO = (char*)0xd409;
/// Channel 2 Pulse Width (0-4095) High byte
char * const SID_CH2_PULSE_WIDTH_HI = (char*)0xd40a;
/// Channel 3 Frequency Low byte
char * const SID_CH3_FREQ_LO = (char*)0xd40e;
/// Channel 3 Frequency High byte
char * const SID_CH3_FREQ_HI = (char*)0xd40f;
/// Channel 3 Pulse Width (0-4095) Low byte
char * const SID_CH3_PULSE_WIDTH_LO = (char*)0xd410;
/// Channel 3 Pulse Width (0-4095) High byte
char * const SID_CH3_PULSE_WIDTH_HI = (char*)0xd411;

/// SID Channel Control Register Noise Waveform
const char SID_CONTROL_NOISE = 0x80;
/// SID Channel Control Register Pulse Waveform / Square Wave
const char SID_CONTROL_PULSE = 0x40;
/// SID Channel Control Register Sawtooth Waveform
const char SID_CONTROL_SAWTOOTH = 0x20;
/// SID Channel Control Register Triangle Waveform
const char SID_CONTROL_TRIANGLE = 0x10;
/// SID Channel Control Register Test bit
const char SID_CONTROL_TEST = 0x08;
/// SID Channel Control Register Ring Modulation
const char SID_CONTROL_RING = 0x04;
/// SID Channel Control Register Synchronization
const char SID_CONTROL_SYNC = 0x02;
/// SID Channel Control Register Gate
const char SID_CONTROL_GATE = 0x01;

