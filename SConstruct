import os
import multiprocessing

num_cpu = multiprocessing.cpu_count()
SetOption('num_jobs', num_cpu)
print("Setting concurrent jobs to %s" % num_cpu)

# TODO get this working
# Build output to bin folder
# SConscript('Hazel/src/SConscript', variant_dir='bin')

compile_flags = ["-std=c++17"]

release = ARGUMENTS.get('release', 0)
if int(release):
  compile_flags.append(['-O3'])
else:
  compile_flags.append(['-g', '-O0'])

hazel_source_dirs = ['Hazel/src']
hazel_include_dirs = hazel_source_dirs + ['.', 'include']
source_files = map(lambda dir: Glob(os.path.join(dir, '*.cpp')), hazel_source_dirs)

env = Environment(CPPPATH = hazel_include_dirs, CXXFLAGS = compile_flags)

env.SharedLibrary('hazel', source_files)

sandbox_source_dirs = ['Sandbox/src']
sandbox_include_dirs = sandbox_source_dirs + ['.', 'include']
sandbox_source_files = map(lambda dir: Glob(os.path.join(dir, '*.cpp')), sandbox_source_dirs)

env.Program('app', sandbox_source_files, LIBS=['hazel'], LIBPATH='.')
