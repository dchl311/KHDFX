import numpy as np


'''
data=np.arange(14)
print(data.shape,data.dtype)

arr1=['2','6','8','3','43','89','5']
brr1=np.array(arr1,dtype=np.string_)
print(brr1,brr1.shape,brr1.dtype)
brr1.astype(float)
print(brr1,brr1.shape,brr1.dtype)

arr2=[[1,3,6,9],[2,4,6,8]]
brr2=np.array(arr2)

print(brr2,'\n',brr2*2,'\n',1/brr2,'\n',brr2**2)
brr2_copy=brr2.copy()
brr2[1,1:3]=99


print(brr2,brr2_copy[:2,1])
brr3=np.random.randn(3,3)
print(brr3)
print(brr3[:2,1:])
print(brr3[:2,1])
'''
names = np.array(['Bob', 'Joe', 'Will', 'Bob', 'Will', 'Joe', 'Joe'])
data = np.random.randn(7, 4)


print(data)
print(names=='Bob')
print(data[names == 'Bob'])

arr = np.empty((8, 4))
for i in range(8):
    arr[i] = i
print(arr[[6,3,5]])