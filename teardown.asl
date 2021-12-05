state("teardown", "Release Version")
{
    bool loading : 0x003E3520, 0xB8, 0x301048;
}

state("teardown", "0.4.6")
{
    bool loading : 0x003E4520, 0xB8, 0x301048;
}

state("teardown", "0.5.2")
{
    bool loading : 0x00408598, 0xB0, 0x301048;
}

state("teardown", "0.5.5")
{
    bool loading : 0x0040E7F8, 0xB0, 0x301048;
}

state("teardown", "0.5.5 (patch 1)")
{
    bool loading : 0x0040F7F8, 0xB0, 0x301048;
}

state("teardown", "0.6.2 (patch 1)")
{
    bool loading : 0x0041CB00, 0xB0, 0x301048;
}

state("teardown", "0.7.2")
{
    bool loading : 0x00436A30, 0xB8, 0x301048;
}

state("teardown", "0.7.4")
{
    bool loading : 0x0043AA50, 0xB8, 0x301048;
}

state("teardown", "0.8.0")
{
    bool loading : 0x00441BE0, 0xB8, 0x301048;
}

state("teardown", "0.9.0")
{
    bool loading : 0x00455100, 0xB8, 0x301048;
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
        case 5103616:
            version = "0.9.0";
            break;
        case 5021696:
            version = "0.8.0";
            break;
        case 4993024:
            version = "0.7.4";
            break;
        case 4972544:
            version = "0.7.2";
            break;
        case 4866048:
            version = "0.6.2 (patch 1)";
            break;
        case 4808704:
            version = "0.5.5 (patch 1)";
            break;
        case 4804608:
            version = "0.5.5";
            break;
        case 4747264:
            version = "0.5.2";
            break;
        case 4599808:
            version = "0.4.6";
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
