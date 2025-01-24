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

state("teardown", "0.9.2 (patch 1)")
{
    bool loading : 0x00456140, 0xB8, 0x301048;
}

state("teardown", "0.9.5")
{
    bool loading : 0x00441780, 0xB8, 0x301048;
}

state("teardown", "1.0.0")
{
    bool loading : 0x0041B480, 0xB8, 0x301048;
}

state("teardown", "1.1.0")
{
    bool loading : 0x00420690, 0xB8, 0x301048;
}

state("teardown", "1.6.2")
{
    bool loading : 0x00B52D90, 0xC8, 0x344028;
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
        case 0xF19000:
            version = "1.6.2";
            break;
        case 0x490000:
            version = "1.1.0";
            break;
        case 0x493000:
            version = "1.0.0";
            break;
        case 0x4BB000:
            version = "0.9.5";
            break;
        case 0x4DF000:
            version = "0.9.2 (patch 1)";
            break;
        case 0x4DE000:
            version = "0.9.0";
            break;
        case 0x4CA000:
            version = "0.8.0";
            break;
        case 0x4C3000:
            version = "0.7.4";
            break;
        case 0x4BE000:
            version = "0.7.2";
            break;
        case 0x4A4000:
            version = "0.6.2 (patch 1)";
            break;
        case 0x496000:
            version = "0.5.5 (patch 1)";
            break;
        case 0x495000:
            version = "0.5.5";
            break;
        case 0x487000:
            version = "0.5.2";
            break;
        case 0x463000:
            version = "0.4.6";
            break;
        default:
            version = "Unknown (0x"+moduleSize.ToString("X")+")";
            break;
    }
}

isLoading
{
    return current.loading;
}
