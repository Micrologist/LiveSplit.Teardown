state("teardown", "Release Version")
{
    bool loading : 0x003E3520, 0xB8, 0x301048;
}

state("teardown", "v0.4.6")
{
    bool loading : 0x003E4520, 0xB8, 0x301048;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {
        var timingMessage = MessageBox.Show(
            "This game uses RTA w/o Loads as the main timing method.\n"
            + "LiveSplit is currently set to show Real Time (RTA).\n"
            + "Would you like to set the timing method to RTA w/o Loads?",
            "Teardown | LiveSplit",
            MessageBoxButtons.YesNo, MessageBoxIcon.Question
        );
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

init
{
    int moduleSize = modules.First().ModuleMemorySize;
    switch (moduleSize)
    {
        case 4599808:
            version = "v0.4.6";
            break;
        default:
            version = "Release Version";
            break;
    }
}

isLoading
{
    return current.loading;
}
