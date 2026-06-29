Import("env")
import subprocess
import sys
from pathlib import Path

project_dir = Path(env["PROJECT_DIR"])
script = project_dir / "htmljs" / "patch-mazza-ui-fixes.ps1"
embedded_cpp = project_dir / "src" / "EmbeddedFiles.cpp"

print("Applying MAZZA UI patches to wdoc...")
result = subprocess.run(
    ["powershell", "-ExecutionPolicy", "Bypass", "-File", str(script)],
    cwd=str(project_dir),
)
if result.returncode != 0:
    sys.exit(result.returncode)

# wdoc/*.h is included via macros; SCons does not track them as dependencies.
# Remove the object file so HTML changes are always linked into the firmware.
embedded_obj = project_dir / ".pio" / "build" / env["PIOENV"] / "src" / "EmbeddedFiles.cpp.o"
if embedded_obj.exists():
    embedded_obj.unlink()
    print("Removed EmbeddedFiles.cpp.o (wdoc dependency refresh)")
elif embedded_cpp.exists():
    embedded_cpp.touch()
    print("Touched src/EmbeddedFiles.cpp (wdoc dependency refresh)")
